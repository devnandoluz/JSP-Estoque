package model;

import dao.DAOlog;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Nando Luz
 */
public class Log {
    private int id;
    private String nome;
    private Date data;
    private Funcionario funcionario;  

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
    
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    //Create
    public void gerarLog() throws Exception{
        DAOlog dao = new DAOlog();
        dao.save(this);
    }
    //Read
    public ArrayList<Log> findAll() throws Exception{   
        DAOlog dao = new DAOlog();
        return dao.findAll();
    }
}
