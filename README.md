# k8sMetabaseSetup
Deploy Metabase com LoadBalance, Setup automatizado via API - Kubernetes. Estudo de escalabilidade do Metabase com Kubernetes e automatização de SETUP pensando em uma solução padrão base por deploy. 

<p align="center">
  <a href="" rel="noopener">
 <img width=500px height=300px src="https://res.cloudinary.com/hevo/image/upload/f_auto,q_auto/v1621578197/hevo-learn/5927b3e6-af6a-4ca9-92b8-6e26b9216192-1589988072377.png" alt="logoaksmetabase"></a>
</p>


<p align="center">
  <a href="" rel="noopener">
 <img width=500px height=300px src="https://miro.medium.com/max/920/1*sMn8N0eoB18aJM2IhKV2vQ.jpeg" alt="logoaksmetabase"></a>
</p>

	
## 📜 Features:
- Script deploy para Docker Compose ou Kubernetes.
- Configmap para configuração do Metabase e do metadata com PostgreSQL.
- Autoscaling Pod horizontal.
- Serviço de LoadBalance.
- Script para Automatizar SETUP do Metabase com criação de usuário admin e autenticação com a base de dados via shell + API.
- Script para deploy com Azure Pipelines.


## 🎯 Backlog:
- Atribuir na pipeline de deploy um step para variavel de ambiente e alimentar o shell script de SETUP com essas variaveis. 
- Criação de paineis/dashboards de forma automatica no script de Setup. 
- Submeter uma base de dados exemplo para os paineis/dashboards do Setup.
