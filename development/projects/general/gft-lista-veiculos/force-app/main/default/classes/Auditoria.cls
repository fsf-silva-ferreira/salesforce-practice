public abstract class Auditoria {

    public String criadoPor;
    public String proprietario;
    
    public virtual String getProprietario() {
        return 'Rafael Martins é o proprietário do Registro';
    }
}