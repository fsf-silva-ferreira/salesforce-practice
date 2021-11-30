//public / global
public class Pessoa {

    public String nome;
	public Integer idade;
    public Integer peso;
    
    public Pessoa() {
        this.idade = 30;
    }
    
     public Pessoa(Integer idade, Integer peso, String nome) {
        this.idade = idade;
		this.peso = peso;
        this.nome = nome;
    }
    
    public virtual void fazerAniversario() {
        idade++;
    }
   
    public Integer getPeso(Integer maisPeso) {
        peso = peso + maisPeso;
        String nome2 = NOME;
        
        return peso;
    }
}