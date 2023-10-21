public class Conta extends Auditoria {

    public String nome;

    public Conta() {
    	this(System.UserInfo.getFirstName() + ' ' + System.UserInfo.getLastName());
    }
    
    public Conta(String nomeUsuario) {
    	nome = nomeUsuario;  
    }
    
    public override String getProprietario() {
        return 'Rafael Martins é o proprietário da conta';
    }
    
    public String getCriadoPor() {
        return 'Rafael Martins criou o registro';
    }
}