//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VotingSite
{
    using System;
    using System.Collections.Generic;
    
    public partial class Voter
    {
        public int VoterID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string SocialNumber { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public System.DateTime SocialNumberIssueDate { get; set; }
        public Nullable<int> PartyID { get; set; }
        public string City { get; set; }
    
        public virtual Party Party { get; set; }
    }
}
