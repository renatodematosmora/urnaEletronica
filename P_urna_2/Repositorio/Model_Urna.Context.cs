﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Repositorio
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class eleicoesEntities : DbContext
    {
        public eleicoesEntities()
            : base("name=eleicoesEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<candidato> candidatoes { get; set; }
        public virtual DbSet<cargo> cargoes { get; set; }
        public virtual DbSet<eleitor> eleitors { get; set; }
        public virtual DbSet<partido> partidoes { get; set; }
        public virtual DbSet<secao> secaos { get; set; }
        public virtual DbSet<urna> urnas { get; set; }
        public virtual DbSet<voto> votos { get; set; }
        public virtual DbSet<zona> zonas { get; set; }
    }
}
