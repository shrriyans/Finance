using System;
using System.Collections.Generic;
using System.Windows.Forms;
using CustomerManagement.Data;
using CustomerManagement.Models;

namespace CustomerManagement.Forms
{
    public partial class ReferenceMasterForm : Form
    {
        private DatabaseConnection dbConnection;
        private List<Reference> references;
        private Reference currentReference;

        public ReferenceMasterForm()
        {
            InitializeComponent();
            dbConnection = new DatabaseConnection();
        }

        private void ReferenceMasterForm_Load(object sender, EventArgs e)
        {
            LoadCities();
            LoadReferences();
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
                references = dbConnection.GetAllReferences();
                dgvReferences.DataSource = references;
                
                // Hide some columns and set others read-only
                if (dgvReferences.Columns["ReferenceId"] != null)
                    dgvReferences.Columns["ReferenceId"].ReadOnly = true;
                if (dgvReferences.Columns["CreatedDate"] != null)
                    dgvReferences.Columns["CreatedDate"].Visible = false;
                if (dgvReferences.Columns["UpdatedDate"] != null)
                    dgvReferences.Columns["UpdatedDate"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading references: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ClearForm()
        {
            currentReference = null;
            txtReferenceId.Clear();
            txtName.Clear();
            txtAddress.Clear();
            txtMobileNo1.Clear();
            txtMobileNo2.Clear();
            txtEmailId.Clear();
            txtReferenceName.Clear();
            
            if (cmbCity.Items.Count > 0)
                cmbCity.SelectedIndex = 0;
            
            chkIsActive.Checked = true;
            txtName.Focus();
        }

        private void PopulateForm(Reference reference)
        {
            currentReference = reference;
            txtReferenceId.Text = reference.ReferenceId.ToString();
            txtName.Text = reference.Name;
            txtAddress.Text = reference.Address;
            txtMobileNo1.Text = reference.MobileNo1;
            txtMobileNo2.Text = reference.MobileNo2;
            txtEmailId.Text = reference.EmailId;
            txtReferenceName.Text = reference.ReferenceName;
            
            cmbCity.SelectedValue = reference.CityId;
            chkIsActive.Checked = reference.IsActive;
        }

        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                MessageBox.Show("Please enter reference name.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtName.Focus();
                return false;
            }

            if (txtName.Text.Length > 150)
            {
                MessageBox.Show("Reference name cannot exceed 150 characters.", "Validation Error", 
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

                Reference reference = new Reference
                {
                    ReferenceId = currentReference?.ReferenceId ?? 0,
                    Name = txtName.Text.Trim(),
                    Address = txtAddress.Text.Trim(),
                    CityId = Convert.ToInt32(cmbCity.SelectedValue),
                    StateId = 1, // Default state
                    MobileNo1 = txtMobileNo1.Text.Trim(),
                    MobileNo2 = txtMobileNo2.Text.Trim(),
                    EmailId = txtEmailId.Text.Trim(),
                    ReferredById = 0, // Can be self-referencing
                    ReferenceName = txtReferenceName.Text.Trim(),
                    IsActive = chkIsActive.Checked
                };

                bool success = dbConnection.SaveReference(reference);
                
                if (success)
                {
                    MessageBox.Show("Reference saved successfully!", "Success", 
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadReferences();
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Failed to save reference.", "Error", 
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving reference: " + ex.Message, "Error", 
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

        private void dgvReferences_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < references.Count)
            {
                PopulateForm(references[e.RowIndex]);
            }
        }
    }
}