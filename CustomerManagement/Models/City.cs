using System;

namespace CustomerManagement.Models
{
    public class City
    {
        public int CityId { get; set; }
        public string CityName { get; set; }
        public string ShortCode { get; set; }
        public int StateId { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}