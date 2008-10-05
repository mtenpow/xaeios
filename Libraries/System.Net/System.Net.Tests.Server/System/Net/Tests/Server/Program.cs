using System;
using System.Collections.Generic;
using System.Net;
using System.Net.JsonRpc;
using System.Linq;
using System.Text;

using Db4o = Db4objects.Db4o;
using Db4objects.Db4o.Config;
using Db4objects.Db4o.Constraints;

using System.Net.Tests.Shared;

namespace System.Net.Tests.Server
{
    class Program
    {
        private const bool DoSetupDatabase = false;
        private const string DatabaseFilePath = "MuZume.Users.db";
        private static JsonRpcServer _jsonRpcServer;
        private static Db4o.IObjectContainer _container;

        static void Main(string[] args)
        {
            if (DoSetupDatabase || !System.IO.File.Exists(DatabaseFilePath))
            {
                SetupDatabase();
            }

            _container = GetDatabaseContainer();

            _jsonRpcServer = new JsonRpcServer();
            _jsonRpcServer.RegisterMethods(typeof(Program), "/");
            _jsonRpcServer.Listen(7777);
        }

        private static void SetupDatabase()
        {
            Console.WriteLine("Setting up database....");
            if (System.IO.File.Exists(DatabaseFilePath))
            {
                System.IO.File.Delete(DatabaseFilePath);
            }
            using (var container = GetDatabaseContainer())
            {

                User mtenpow = new User("Michael", "Arthur", "Ten-Pow", "m.public@tenpow.com", "ABCDEFG");
                container.Store(mtenpow);

                User mdirolf = new User("Michael", "Kyle", "Dirolf", "mdirolf@dirolf.com", "ABCDEFG");
                container.Store(mdirolf);

                container.Commit();

                IList<User> users = container.Query<User>();

                PrintAll<User>(users);
            }
            Console.WriteLine("Done setting up database!");
        }

        private static Db4o.IObjectContainer GetDatabaseContainer()
        {
            return Db4o.Db4oFactory.OpenFile(GetDatabaseConfiguration(), DatabaseFilePath);
        }

        private static IConfiguration GetDatabaseConfiguration()
        {
            IConfiguration configuration = Db4o.Db4oFactory.NewConfiguration();
            configuration.ObjectClass(typeof(User)).ObjectField("_emailAddress").Indexed(true);
            configuration.Add(new UniqueFieldValueConstraint(typeof(User), "_emailAddress"));
            return configuration;
        }

        private static void PrintAll<T>(IList<T> items)
        {
            foreach (var item in items)
            {
                Console.WriteLine("Found: " + item);
            }
        }

        private static IUser GetUser(string emailAddress)
        {
            IList<IUser> users = _container.Query<IUser>(delegate(IUser user)
            {
                return user.EmailAddress == emailAddress;
            });
            int count = users.Count;
            if (count == 0)
            {
                return null;
            }
            else if (count > 1)
            {
                throw new Exception("Found multiple users with the email address: " + emailAddress);
            }
            else
            {
                return users[0];
            }
        }

        [JsonRpcMethod]
        public static User Authenticate(string emailAddress, string passwordHash)
        {
            IUser user = GetUser(emailAddress);
            if (user == null)
            {
                throw new InvalidUsernameAndPasswordException();
            }
            if (user.PasswordHash != passwordHash)
            {
                throw new InvalidUsernameAndPasswordException();
            }
            return (User)user;
        }

    }
}
