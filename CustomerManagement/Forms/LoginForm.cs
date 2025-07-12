using System;
using System.Windows.Forms;
using CustomerManagement.Data;

namespace CustomerManagement.Forms
{
    public partial class LoginForm : Form
    {
        private DatabaseConnection dbConnection;

        public LoginForm()
        {
            InitializeComponent();
            dbConnection = new DatabaseConnection();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtUserId.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    MessageBox.Show("Please enter both User ID and Password.", "Validation Error", 
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (dbConnection.AuthenticateUser(txtUserId.Text, txtPassword.Text))
                {
                    MessageBox.Show("Login successful!", "Success", 
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    
                    MainForm mainForm = new MainForm();
                    this.Hide();
                    mainForm.ShowDialog();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Invalid User ID or Password.", "Login Failed", 
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtPassword.Clear();
                    txtUserId.Focus();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Database Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
            txtUserId.Focus();
        }
    }
}