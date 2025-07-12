using System;
using System.Collections.Generic;
using System.Windows.Forms;
using CustomerManagement.Data;
using CustomerManagement.Models;

namespace CustomerManagement.Forms
{
    public partial class CustomerMasterForm : Form
    {
        private DatabaseConnection dbConnection;
        private List<Customer> customers;
        private Customer currentCustomer;

        public CustomerMasterForm()
        {
            InitializeComponent();
            dbConnection = new DatabaseConnection();
        }

        private void CustomerMasterForm_Load(object sender, EventArgs e)
        {
            LoadCities();
            LoadReferences();
            LoadCustomers();
            ClearForm();
        }

        private void LoadCities()
        {
            try
            {
                var cities = dbConnection.GetAllCities();
                cmbCity.DataSource = cities;
                cmbCity.DisplayMember = "CityName";
                cmbCity.ValueMember = "CityId";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading cities: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void LoadReferences()
        {
            try
            {
                var references = dbConnection.GetAllReferences();
                cmbReference.DataSource = references;
                cmbReference.DisplayMember = "Name";
                cmbReference.ValueMember = "ReferenceId";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading references: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void LoadCustomers()
        {
            try
            {
                customers = dbConnection.GetAllCustomers();
                dgvCustomers.DataSource = customers;
                
                // Hide some columns and set others read-only
                if (dgvCustomers.Columns["CustomerId"] != null)
                    dgvCustomers.Columns["CustomerId"].ReadOnly = true;
                if (dgvCustomers.Columns["CreatedDate"] != null)
                    dgvCustomers.Columns["CreatedDate"].Visible = false;
                if (dgvCustomers.Columns["UpdatedDate"] != null)
                    dgvCustomers.Columns["UpdatedDate"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading customers: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ClearForm()
        {
            currentCustomer = null;
            txtCustomerId.Clear();
            txtName.Clear();
            txtAddress.Clear();
            txtMobileNo1.Clear();
            txtMobileNo2.Clear();
            txtEmailId.Clear();
            txtReferenceName.Clear();
            
            if (cmbCity.Items.Count > 0)
                cmbCity.SelectedIndex = 0;
            if (cmbReference.Items.Count > 0)
                cmbReference.SelectedIndex = 0;
            
            chkIsActive.Checked = true;
            txtName.Focus();
        }

        private void PopulateForm(Customer customer)
        {
            currentCustomer = customer;
            txtCustomerId.Text = customer.CustomerId.ToString();
            txtName.Text = customer.Name;
            txtAddress.Text = customer.Address;
            txtMobileNo1.Text = customer.MobileNo1;
            txtMobileNo2.Text = customer.MobileNo2;
            txtEmailId.Text = customer.EmailId;
            txtReferenceName.Text = customer.ReferenceName;
            
            cmbCity.SelectedValue = customer.CityId;
            cmbReference.SelectedValue = customer.ReferredById;
            chkIsActive.Checked = customer.IsActive;
        }

        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                MessageBox.Show("Please enter customer name.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtName.Focus();
                return false;
            }

            if (txtName.Text.Length > 150)
            {
                MessageBox.Show("Customer name cannot exceed 150 characters.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtName.Focus();
                return false;
            }

            return true;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!ValidateForm())
                    return;

                Customer customer = new Customer
                {
                    CustomerId = currentCustomer?.CustomerId ?? 0,
                    Name = txtName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    CityId = Convert.ToInt32(cmbCity.SelectedValue),
                    StateId = 1, // Default state
                    MobileNo1 = txtMobileNo1.Text.Trim(),
                    MobileNo2 = txtMobileNo2.Text.Trim(),
                    EmailId = txtEmailId.Text.Trim(),
                    ReferredById = Convert.ToInt32(cmbReference.SelectedValue),
                    ReferenceName = txtReferenceName.Text.Trim(),
                    IsActive = chkIsActive.Checked
                };

                bool success = dbConnection.SaveCustomer(customer);
                
                if (success)
                {
                    MessageBox.Show("Customer saved successfully!", "Success", 
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadCustomers();
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Failed to save customer.", "Error", 
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving customer: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dgvCustomers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < customers.Count)
            {
                PopulateForm(customers[e.RowIndex]);
            }
        }
    }
}