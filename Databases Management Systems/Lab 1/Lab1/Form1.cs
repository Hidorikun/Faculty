using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Lab1
{
    public partial class Form1 : Form
    {
        private DataSet dataset;
        private SqlDataAdapter agencyAdapter;
        private SqlDataAdapter spyAdapter; 

        public Form1()
        {
            InitializeComponent();
            fillData();
        }
  
        private string getConnectionString()
        {
            return "Data Source=DESKTOP-4P7IG6S\\SQLEXPRESS;" +
                   "Initial Catalog=SECRET_SERVICES;" +
                   "Integrated Security = true;";
        }

        private void verifyConnection()
        {
            SqlConnection cnn = new SqlConnection(getConnectionString());
            SqlDataReader reader = null;
            try
            {
                cnn.Open();
                Console.WriteLine("Connection Open!");
                SqlCommand command = new SqlCommand("select * from Spy", cnn);
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine("ID: " + reader[0] + " real_name: " + reader[1] + " code_name: " + reader[2] + " agency_id: " + reader[3]);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (reader != null)
                {
                    reader.Close();
                }
                
                cnn.Close();
            }
        }

        private void fillData()
        {
            agencyAdapter = new SqlDataAdapter("select * from Agency", getConnectionString());
            spyAdapter = new SqlDataAdapter("select * from Spy", getConnectionString());

            dataset = new DataSet();

            agencyAdapter.Fill(dataset, "Agency");
            spyAdapter.Fill(dataset, "Spy");

            dataset.Relations.Add(new DataRelation("Relation", dataset.Tables["Agency"].Columns["id"], dataset.Tables["Spy"].Columns["AgencyID"]));
            this.dataGridView1.DataSource = dataset.Tables["Agency"];
            this.dataGridView2.DataSource = this.dataGridView1.DataSource;
            this.dataGridView2.DataMember = "Relation"; 
        }

        private void addChildButton_Click(object sender, EventArgs e)
        {

            int id          = (int)dataGridView2.CurrentRow.Cells[0].Value;
            string realName = (string)dataGridView2.CurrentRow.Cells[1].Value;
            string codeName = (string)dataGridView2.CurrentRow.Cells[2].Value;
            int agencyId    = (int)dataGridView1.CurrentRow.Cells[0].Value;

            DataRow newRow = dataset.Tables["Spy"].NewRow();

            newRow["id"] = id;
            newRow["real_name"] = realName;
            newRow["code_name"] = codeName;
            newRow["AgencyID"]  = agencyId;

            dataset.Tables["Spy"].Rows.Add(newRow);

            SqlCommandBuilder objCommandBuilder = new SqlCommandBuilder(spyAdapter);
            try
            {
                spyAdapter.Update(dataset, "Spy");
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            dataGridView2.DataSource = dataset.Tables["Spy"];
        }

        private void updateChildButton_Click(object sender, EventArgs e)
        {

            int id = (int)dataGridView2.CurrentRow.Cells[0].Value;
            string realName = (string)dataGridView2.CurrentRow.Cells[1].Value;
            string codeName = (string)dataGridView2.CurrentRow.Cells[2].Value;
            int agencyId = (int)dataGridView1.CurrentRow.Cells[0].Value;

            SqlCommand selectCommand = new SqlCommand("SELECT * FROM Spy WHERE AgencyID = @id", new SqlConnection(getConnectionString()));

            selectCommand.Parameters.AddWithValue("@id", agencyId);

            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);

            DataSet dataset = new DataSet();

            adapter.Fill(dataset, "Spy");
            dataset.Tables["Spy"].PrimaryKey = new[] { dataset.Tables["Spy"].Columns[0] };
            DataRow currentRow = dataset.Tables["Spy"].Rows.Find(id);
            currentRow.BeginEdit();
            currentRow["real_name"] = realName;
            currentRow["code_name"] = codeName;
            currentRow["AgencyID"]  = agencyId;
            currentRow.EndEdit();

            SqlCommandBuilder objCommandBuilder = new SqlCommandBuilder(adapter);
            adapter.Update(dataset, "Spy");
        }

        private void removeChildButton_Click(object sender, EventArgs e)
        {
            int id = (int)dataGridView2.CurrentRow.Cells[0].Value;
            int agencyId = (int)dataGridView1.CurrentRow.Cells[0].Value;

            SqlCommand selectCommand = new SqlCommand("SELECT * FROM Spy WHERE AgencyID = @id", new SqlConnection(getConnectionString()));

            selectCommand.Parameters.AddWithValue("@id", agencyId);

            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);

            DataSet dataset = new DataSet();

            adapter.Fill(dataset, "Spy");
            dataset.Tables["Spy"].PrimaryKey = new[] { dataset.Tables["Spy"].Columns[0] };
            dataset.Tables["Spy"].Rows.Find(id).Delete();
  
            SqlCommandBuilder objCommandBuilder = new SqlCommandBuilder(adapter);
            adapter.Update(dataset, "Spy");
        }
    }
}
