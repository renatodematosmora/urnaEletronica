using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public class CandidatoRepositorio
    {
        public candidato selecionarDF(string numCand)
        {
            candidato can = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                can = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) && cand.codigo_cargo == 2 select cand).FirstOrDefault();
            }
            return can;
        }

        public candidato selecionarDE(string numCand)
        {
            candidato can = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                can = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) && cand.codigo_cargo == 1 select cand).FirstOrDefault();
            }
            return can;
        }

        public candidato selecionarSE(string numCand)
        {
            candidato can = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                can = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) && cand.codigo_cargo == 3 select cand).FirstOrDefault();
            }
            return can;
        }

        public candidato selecionarGO(string numCand)
        {
            candidato can = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                can = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) && cand.codigo_cargo == 4 select cand).FirstOrDefault();
            }
            return can;
        }

        public candidato selecionarPR(string numCand)
        {
            candidato can = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                can = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) && cand.codigo_cargo == 5 select cand).FirstOrDefault();
            }
            return can;
        }

        public List<candidato> selecionarLista(string numCand)
        {
            List<candidato> lista = null;
            using (eleicoesEntities db = new eleicoesEntities())
            {
                lista = (from cand in db.candidato where cand.numeroeleitoral_candidato.Equals(numCand) select cand).ToList();
            }
            return lista;
        }
    }
}
