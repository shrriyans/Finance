using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using CustomerManagement.Models;
using System.Collections.Generic;

namespace CustomerManagement.Data
{
    public class DatabaseConnection
    {
        private string connectionString;

        public DatabaseConnection()
        {
            connectionString = ConfigurationManager.ConnectionStrings["MySqlConnectionString"].ConnectionString;
        }

        // User Authentication
        public bool AuthenticateUser(string username, string password)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM Users WHERE UserName = @username AND Password = @password AND IsActive = 1";
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@username", username);
                        command.Parameters.AddWithValue("@password", password);
                        
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Authentication failed: " + ex.Message);
            }
        }

        // City Operations
        public List<City> GetAllCities()
        {
            List<City> cities = new List<City>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM CityMaster WHERE IsActive = 1 ORDER BY CityName";
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                cities.Add(new City
                                {
                                    CityId = Convert.ToInt32(reader["CityId"]),
                                    CityName = reader["CityName"].ToString(),
                                    ShortCode = reader["ShortCode"].ToString(),
                                    StateId = Convert.ToInt32(reader["StateId"]),
                                    IsActive = Convert.ToBoolean(reader["IsActive"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to get cities: " + ex.Message);
            }
            return cities;
        }

        public bool SaveCity(City city)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query;
                    
                    if (city.CityId == 0)
                    {
                        query = "INSERT INTO CityMaster (CityName, ShortCode, StateId, IsActive) VALUES (@cityName, @shortCode, @stateId, @isActive)";
                    }
                    else
                    {
                        query = "UPDATE CityMaster SET CityName = @cityName, ShortCode = @shortCode, StateId = @stateId, IsActive = @isActive WHERE CityId = @cityId";
                    }
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@cityName", city.CityName);
                        command.Parameters.AddWithValue("@shortCode", city.ShortCode);
                        command.Parameters.AddWithValue("@stateId", city.StateId);
                        command.Parameters.AddWithValue("@isActive", city.IsActive);
                        
                        if (city.CityId != 0)
                        {
                            command.Parameters.AddWithValue("@cityId", city.CityId);
                        }
                        
                        return command.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to save city: " + ex.Message);
            }
        }

        // Customer Operations
        public List<Customer> GetAllCustomers()
        {
            List<Customer> customers = new List<Customer>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM CustomerMaster WHERE IsActive = 1 ORDER BY Name";
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                customers.Add(new Customer
                                {
                                    CustomerId = Convert.ToInt32(reader["CustomerId"]),
                                    Name = reader["Name"].ToString(),
                                    Address = reader["Address"].ToString(),
                                    CityId = Convert.ToInt32(reader["CityId"]),
                                    StateId = Convert.ToInt32(reader["StateId"]),
                                    MobileNo1 = reader["MobileNo1"].ToString(),
                                    MobileNo2 = reader["MobileNo2"].ToString(),
                                    EmailId = reader["EmailId"].ToString(),
                                    ReferredById = Convert.ToInt32(reader["ReferredById"]),
                                    ReferenceName = reader["ReferenceName"].ToString(),
                                    IsActive = Convert.ToBoolean(reader["IsActive"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to get customers: " + ex.Message);
            }
            return customers;
        }

        public bool SaveCustomer(Customer customer)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query;
                    
                    if (customer.CustomerId == 0)
                    {
                        query = @"INSERT INTO CustomerMaster (Name, Address, CityId, StateId, MobileNo1, MobileNo2, EmailId, ReferredById, ReferenceName, IsActive) 
                                 VALUES (@name, @address, @cityId, @stateId, @mobileNo1, @mobileNo2, @emailId, @referredById, @referenceName, @isActive)";
                    }
                    else
                    {
                        query = @"UPDATE CustomerMaster SET Name = @name, Address = @address, CityId = @cityId, StateId = @stateId, 
                                 MobileNo1 = @mobileNo1, MobileNo2 = @mobileNo2, EmailId = @emailId, ReferredById = @referredById, 
                                 ReferenceName = @referenceName, IsActive = @isActive WHERE CustomerId = @customerId";
                    }
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@name", customer.Name);
                        command.Parameters.AddWithValue("@address", customer.Address ?? "");
                        command.Parameters.AddWithValue("@cityId", customer.CityId);
                        command.Parameters.AddWithValue("@stateId", customer.StateId);
                        command.Parameters.AddWithValue("@mobileNo1", customer.MobileNo1 ?? "");
                        command.Parameters.AddWithValue("@mobileNo2", customer.MobileNo2 ?? "");
                        command.Parameters.AddWithValue("@emailId", customer.EmailId ?? "");
                        command.Parameters.AddWithValue("@referredById", customer.ReferredById);
                        command.Parameters.AddWithValue("@referenceName", customer.ReferenceName ?? "");
                        command.Parameters.AddWithValue("@isActive", customer.IsActive);
                        
                        if (customer.CustomerId != 0)
                        {
                            command.Parameters.AddWithValue("@customerId", customer.CustomerId);
                        }
                        
                        return command.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to save customer: " + ex.Message);
            }
        }

        // Reference Operations
        public List<Reference> GetAllReferences()
        {
            List<Reference> references = new List<Reference>();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM ReferenceMaster WHERE IsActive = 1 ORDER BY Name";
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                references.Add(new Reference
                                {
                                    ReferenceId = Convert.ToInt32(reader["ReferenceId"]),
                                    Name = reader["Name"].ToString(),
                                    Address = reader["Address"].ToString(),
                                    CityId = Convert.ToInt32(reader["CityId"]),
                                    StateId = Convert.ToInt32(reader["StateId"]),
                                    MobileNo1 = reader["MobileNo1"].ToString(),
                                    MobileNo2 = reader["MobileNo2"].ToString(),
                                    EmailId = reader["EmailId"].ToString(),
                                    ReferredById = Convert.ToInt32(reader["ReferredById"]),
                                    ReferenceName = reader["ReferenceName"].ToString(),
                                    IsActive = Convert.ToBoolean(reader["IsActive"])
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to get references: " + ex.Message);
            }
            return references;
        }

        public bool SaveReference(Reference reference)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query;
                    
                    if (reference.ReferenceId == 0)
                    {
                        query = @"INSERT INTO ReferenceMaster (Name, Address, CityId, StateId, MobileNo1, MobileNo2, EmailId, ReferredById, ReferenceName, IsActive) 
                                 VALUES (@name, @address, @cityId, @stateId, @mobileNo1, @mobileNo2, @emailId, @referredById, @referenceName, @isActive)";
                    }
                    else
                    {
                        query = @"UPDATE ReferenceMaster SET Name = @name, Address = @address, CityId = @cityId, StateId = @stateId, 
                                 MobileNo1 = @mobileNo1, MobileNo2 = @mobileNo2, EmailId = @emailId, ReferredById = @referredById, 
                                 ReferenceName = @referenceName, IsActive = @isActive WHERE ReferenceId = @referenceId";
                    }
                    
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@name", reference.Name);
                        command.Parameters.AddWithValue("@address", reference.Address ?? "");
                        command.Parameters.AddWithValue("@cityId", reference.CityId);
                        command.Parameters.AddWithValue("@stateId", reference.StateId);
                        command.Parameters.AddWithValue("@mobileNo1", reference.MobileNo1 ?? "");
                        command.Parameters.AddWithValue("@mobileNo2", reference.MobileNo2 ?? "");
                        command.Parameters.AddWithValue("@emailId", reference.EmailId ?? "");
                        command.Parameters.AddWithValue("@referredById", reference.ReferredById);
                        command.Parameters.AddWithValue("@referenceName", reference.ReferenceName ?? "");
                        command.Parameters.AddWithValue("@isActive", reference.IsActive);
                        
                        if (reference.ReferenceId != 0)
                        {
                            command.Parameters.AddWithValue("@referenceId", reference.ReferenceId);
                        }
                        
                        return command.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to save reference: " + ex.Message);
            }
        }
    }
}