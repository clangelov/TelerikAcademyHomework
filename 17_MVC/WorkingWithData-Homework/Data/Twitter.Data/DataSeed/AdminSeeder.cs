﻿namespace Twitter.Data.DataSeed
{
    using System.Linq;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Twitter.Data.Models;

    public class AdminSeeder : IDataSeeder
    {
        public void Seed(TwitterDbContext context)
        {
            const string roleName = "Admin";
            const string masterAdminUserName = "master@gmail.com";

            var isMasterAdminSeeded = context.Users.Any(u => u.UserName == masterAdminUserName);

            if (!isMasterAdminSeeded)
            {
                var userManager = new UserManager<User>(new UserStore<User>(context));
                var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));

                userManager.Create(new User() { UserName = masterAdminUserName, Email = masterAdminUserName }, "123456");

                roleManager.Create(new IdentityRole() { Name = roleName });

                var admin = context.Users.FirstOrDefault(u => u.UserName == masterAdminUserName);

                userManager.AddToRole(admin.Id, roleName);
            }
        }
    }
}
