using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Lab1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            dataGridView1.SelectionChanged += new EventHandler(loadChildren);
            loadParents();
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

        private void loadChildren()
        {
            int agencyId = (int)dataGridView1.CurrentRow.Cells[0].Value;

            SqlCommand command = new SqlCommand("SELECT * FROM Spy WHERE AgencyID = @id");
            command.Connection = new SqlConnection(getConnectionString());
            command.Parameters.AddWithValue("@id", agencyId);

            SqlDataAdapter spyTable = new SqlDataAdapter(command);
            DataSet dataset = new DataSet();

            spyTable.Fill(dataset, "Spy");
            dataGridView2.DataSource = dataset.Tables["Spy"];
        }

        private void loadChildren(object sender, EventArgs e)
        {
            loadChildren();
        }


        private void loadParents()
        {
            SqlDataAdapter agencyTable = new SqlDataAdapter("select * from Agency", getConnectionString());
            DataSet dataset = new DataSet();

            agencyTable.Fill(dataset, "Agency");
            this.dataGridView1.DataSource = dataset.Tables["Agency"];
        }

        private void addChildButton_Click(object sender, EventArgs e)
        {

            int id          = (int)dataGridView2.CurrentRow.Cells[0].Value;
            string realName = (string)dataGridView2.CurrentRow.Cells[1].Value;
            string codeName = (string)dataGridView2.CurrentRow.Cells[2].Value;
            int agencyId    = (int)dataGridView1.CurrentRow.Cells[0].Value;

            SqlCommand selectCommand = new SqlCommand("SELECT * FROM Spy WHERE AgencyID = @id", new SqlConnection(getConnectionString()));
     
            selectCommand.Parameters.AddWithValue("@id", agencyId);

            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
             
            DataSet dataset = new DataSet();

            adapter.Fill(dataset, "Spy");

            DataRow newRow = dataset.Tables["Spy"].NewRow();

            newRow["id"] = id;
            newRow["real_name"] = realName;
            newRow["code_name"] = codeName;
            newRow["AgencyID"]  = agencyId;

            dataset.Tables["Spy"].Rows.Add(newRow);

            SqlCommandBuilder objCommandBuilder = new SqlCommandBuilder(adapter);
            adapter.Update(dataset, "Spy");

            dataGridView2.DataSource = dataset.Tables["Spy"];
            loadChildren();
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
            loadChildren();
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
            loadChildren();
        }
    }
}
