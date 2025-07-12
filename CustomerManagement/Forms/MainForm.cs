using System;
using System.Windows.Forms;

namespace CustomerManagement.Forms
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void btnCustomerMaster_Click(object sender, EventArgs e)
        {
            CustomerMasterForm customerForm = new CustomerMasterForm();
            customerForm.ShowDialog();
        }

        private void btnCityMaster_Click(object sender, EventArgs e)
        {
            CityMasterForm cityForm = new CityMasterForm();
            cityForm.ShowDialog();
        }

        private void btnReferenceMaster_Click(object sender, EventArgs e)
        {
            ReferenceMasterForm referenceForm = new ReferenceMasterForm();
            referenceForm.ShowDialog();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            this.Text = "Customer Management System - Main Menu";
        }
    }
}