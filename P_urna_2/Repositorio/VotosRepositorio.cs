using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public class VotosRepositorio
    {
        public void inserir(voto vot)
        {
            using(eleicoesEntities db = new eleicoesEntities())
            {
                db.votos.Add(vot);
                db.SaveChanges();
            }
        }
    }
}
