using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public class CandidatosRepositorio
    {
        public List<candidato> selecionarLista(string numCand)
        {
            List<candidato> lista = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                lista = (from cand in db.candidatoes where cand.numeroeleitoral_candidato.Contains(numCand) select cand).ToList();
            }
            return lista;
        }

        public candidato selecionar(string numCand)
        {
            candidato cand = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                cand = (from can in db.candidatoes where can.numeroeleitoral_candidato == numCand select can).FirstOrDefault();
            }
            return cand;
        }
    }
}
