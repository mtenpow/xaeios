using System;
using System.Collections.Generic;
using System.Net;
using System.Net.JsonRpc;

namespace System.Net.Tests.Shared
{
    public interface IUser
    {
        string FirstName { get; set; }
        string MiddleName { get; set; }
        string LastName { get; set; }
        string EmailAddress { get; set; }
        string PasswordHash { get; set; }
    }

    public class User : IUser
    {
        #region IUser Members

        public string FirstName
        {
            get;
            set;
        }

        public string MiddleName
        {
            get;
            set;
        }

        public string LastName
        {
            get;
            set;
        }

        public string EmailAddress
        {
            get
            {
                return _emailAddress;
            }
            set
            {
                _emailAddress = value;
            }
        }
        /// <summary>
        /// We don't use auto-properties here because this is a unique field
        /// </summary>
        private string _emailAddress;

        public string PasswordHash
        {
            get;
            set;
        }

        #endregion

        public User(string firstName, string middleName, string lastName, string emailAddress, string passwordHash)
        {
            FirstName = firstName;
            MiddleName = middleName;
            LastName = lastName;
            EmailAddress = emailAddress;
            PasswordHash = passwordHash;
        }

        public override string ToString()
        {
            return "{User: " + EmailAddress + "}";
        }
    }

    [JsonRpcReportableException(403, "AccessDenied")]
    public abstract class AuthenticationException : Exception
    {
        public int StatusCode
        {
            get
            {
                return 403;
            }
        }

        public virtual string ErrorCode
        {
            get
            {
                return "AccessDenied";
            }
        }

        protected AuthenticationException(string message)
            : base(message)
        {
        }
    }

    public class InvalidUsernameAndPasswordException : AuthenticationException
    {
        public InvalidUsernameAndPasswordException()
            : base("Invalid username/password combination")
        {
        }
    }
}
