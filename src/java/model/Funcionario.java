package model;

import dao.DAOfuncionario;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Nando Luz
 */
public class Funcionario {
    
    //variaveis
    private int id;
    private Usuario usuario;
    private String cpf;
    private String nome;
    private String rg;
    private Date dataDeNascimento;
    private String sexo;
    private String cargo;
    private String endereco;
    private String telefone;
    private String email;

    //get and set
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Date getDataDeNascimento() {
        return dataDeNascimento;
    }

    public void setDataDeNascimento(Date dataDeNascimento) {
        this.dataDeNascimento = dataDeNascimento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * 
     * CHAMADA DA DAO 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOfuncionario dao = new DAOfuncionario();
        dao.save(this);
    }
    public void insertSemUsuario() throws Exception{
        DAOfuncionario dao = new DAOfuncionario();
        dao.saveSemUsuario(this);
    }
    //Read
    public ArrayList<Funcionario> findAll() throws Exception{   
        DAOfuncionario dao = new DAOfuncionario();
        return dao.findAll();
    }
    
    public Funcionario findForID(int id) throws Exception{
        DAOfuncionario dao = new DAOfuncionario();
        return dao.findForID(id);
    }
    //Update
    public void update() throws Exception{ 
        DAOfuncionario dao = new DAOfuncionario();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOfuncionario dao = new DAOfuncionario();
        dao.delete(this);
    }

}
