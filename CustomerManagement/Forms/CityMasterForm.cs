using System;
using System.Collections.Generic;
using System.Windows.Forms;
using CustomerManagement.Data;
using CustomerManagement.Models;

namespace CustomerManagement.Forms
{
    public partial class CityMasterForm : Form
    {
        private DatabaseConnection dbConnection;
        private List<City> cities;
        private City currentCity;

        public CityMasterForm()
        {
            InitializeComponent();
            dbConnection = new DatabaseConnection();
        }

        private void CityMasterForm_Load(object sender, EventArgs e)
        {
            LoadCities();
            ClearForm();
        }

        private void LoadCities()
        {
            try
            {
                cities = dbConnection.GetAllCities();
                dgvCities.DataSource = cities;
                
                // Hide some columns and set others read-only
                if (dgvCities.Columns["CityId"] != null)
                    dgvCities.Columns["CityId"].ReadOnly = true;
                if (dgvCities.Columns["CreatedDate"] != null)
                    dgvCities.Columns["CreatedDate"].Visible = false;
                if (dgvCities.Columns["UpdatedDate"] != null)
                    dgvCities.Columns["UpdatedDate"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading cities: " + ex.Message, "Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ClearForm()
        {
            currentCity = null;
            txtCityId.Clear();
            txtCityName.Clear();
            txtShortCode.Clear();
            chkIsActive.Checked = true;
            txtCityName.Focus();
        }

        private void PopulateForm(City city)
        {
            currentCity = city;
            txtCityId.Text = city.CityId.ToString();
            txtCityName.Text = city.CityName;
            txtShortCode.Text = city.ShortCode;
            chkIsActive.Checked = city.IsActive;
        }

        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtCityName.Text))
            {
                MessageBox.Show("Please enter city name.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtCityName.Focus();
                return false;
            }

            if (txtCityName.Text.Length > 50)
            {
                MessageBox.Show("City name cannot exceed 50 characters.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtCityName.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtShortCode.Text))
            {
                MessageBox.Show("Please enter short code.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtShortCode.Focus();
                return false;
            }

            if (txtShortCode.Text.Length > 5)
            {
                MessageBox.Show("Short code cannot exceed 5 characters.", "Validation Error", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtShortCode.Focus();
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

                City city = new City
                {
                    CityId = currentCity?.CityId ?? 0,
                    CityName = txtCityName.Text.Trim(),
                    ShortCode = txtShortCode.Text.Trim(),
                    StateId = 1, // Default state
                    IsActive = chkIsActive.Checked
                };

                bool success = dbConnection.SaveCity(city);
                
                if (success)
                {
                    MessageBox.Show("City saved successfully!", "Success", 
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadCities();
                    ClearForm();
                }
                else
                {
                    MessageBox.Show("Failed to save city.", "Error", 
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving city: " + ex.Message, "Error", 
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

        private void dgvCities_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < cities.Count)
            {
                PopulateForm(cities[e.RowIndex]);
            }
        }
    }
}