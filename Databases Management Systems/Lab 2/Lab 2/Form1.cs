using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace Lab_2
{
    public partial class Form1 : Form
    {
        SqlConnection cs = new SqlConnection(
           "Data Source=DESKTOP-B2S14AI;" +
           "Initial Catalog=SECRET_SERVICES;" +
           "Integrated Security=True"
           );

        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        BindingSource bs = new BindingSource();

        public Form1()
        {
            InitializeComponent();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
          
        }

        private void button1_Click(object sender, EventArgs e)
        {
          
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void displayBtn_Click(object sender, EventArgs e)
        {
           

            da.SelectCommand = new SqlCommand("SELECT * FROM Agency", cs);
            ds.Clear();
            da.Fill(ds);
         
            dataGridView.DataSource = ds.Tables[0];
            bs.DataSource = ds.Tables[0];
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            da.InsertCommand = new SqlCommand("INSERT INTO Agency VALUES (@name, @country, @abreviation)", cs);
            da.InsertCommand.Parameters.Add("@name", SqlDbType.VarChar).Value = nameTextBox.Text;
            da.InsertCommand.Parameters.Add("@country", SqlDbType.VarChar).Value = countryTextBox.Text;
            da.InsertCommand.Parameters.Add("@abreviation", SqlDbType.VarChar).Value = abrTextBox.Text;

            cs.Open();
            da.InsertCommand.ExecuteNonQuery();
            cs.Close();
        }

        private void updateBtn_Click(object sender, EventArgs e)
        {
            int x;
            da.UpdateCommand = new SqlCommand("Update Agency set name=@name, country=@country, abreviation=@abr where id=@id", cs);
            da.UpdateCommand.Parameters.Add("@name", SqlDbType.VarChar).Value = nameTextBox.Text;
            da.UpdateCommand.Parameters.Add("@country", SqlDbType.VarChar).Value = countryTextBox.Text;
            da.UpdateCommand.Parameters.Add("@abr", SqlDbType.VarChar).Value = abrTextBox.Text;
            da.UpdateCommand.Parameters.Add("@id", SqlDbType.Int).Value = ds.Tables[0].Rows[bs.Position][0];

            cs.Open();
            x = da.UpdateCommand.ExecuteNonQuery();
            cs.Close();

            if (x >= 1)
            {
                MessageBox.Show("The record has been updated");
            }
        }

        private void deleteBtn_Click(object sender, EventArgs e)
        {
            DialogResult dr;
            dr = MessageBox.Show("Are you sure?\n No undo after delete", "Confirm Deletion", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                da.DeleteCommand = new SqlCommand("Delete from Agency where ID=@id", cs);
                da.DeleteCommand.Parameters.Add("@id", SqlDbType.Int).Value = ds.Tables[0].Rows[bs.Position][0];

                cs.Open();
                da.DeleteCommand.ExecuteNonQuery();
                cs.Close();

                ds.Clear();
                da.Fill(ds);
            }
            else
            {
                MessageBox.Show("Deletion Aborded");
            }
        }

        private void firstBtn_Click(object sender, EventArgs e)
        {
            bs.MoveFirst();
            dataGridViewUpdate();
            records();
        }

        private void previousBtn_Click(object sender, EventArgs e)
        {
            bs.MovePrevious();
            dataGridViewUpdate();
            records();
        }

        private void nextBtn_Click(object sender, EventArgs e)
        {
            bs.MoveNext();
            dataGridViewUpdate();
            records();
        }

        private void lastBtn_Click(object sender, EventArgs e)
        {
            bs.MoveLast();
            dataGridViewUpdate();
            records();
        }

        private void dataGridViewUpdate() {
            dataGridView.ClearSelection();
            dataGridView.Rows[bs.Position].Selected = true;
            records();
        }

        private void records() {
            indexLabel.Text = "Record " + bs.Position + " of " + (bs.Count - 1);
        }

 
    }
}
