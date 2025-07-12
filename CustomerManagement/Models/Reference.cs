using System;

namespace CustomerManagement.Models
{
    public class Reference
    {
        public int ReferenceId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }
        public int StateId { get; set; }
        public string MobileNo1 { get; set; }
        public string MobileNo2 { get; set; }
        public string EmailId { get; set; }
        public int ReferredById { get; set; }
        public string ReferenceName { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}