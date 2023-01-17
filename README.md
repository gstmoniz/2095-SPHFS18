<p align="center">
  <img src="https://d1mf66us61usti.cloudfront.net/image-git3.png">
</p>

Welcome to year 2095. We are now living inside space-cities around 3.8 lightyears from Earth since our planet was completely dominated by Pluto's cyborg chimpanzees. We're also, as you should know, in the middle of the Fifth Suprasupercluster War.</br>
  </br>
Feel the rush of being part of the acclaimed SPHFS/18 - Special Plasma Heavy Force Squad 18, and save us from the terrifying Y-23A Zorg, a mach-80 strobotic hypersonic magnetic cannon weapon. And remember: you can always be a SIGMA! :medal_military:

---                                                             
### `OPERATION: ALPHA-BRAVO S4-DELTA/113-15 LMS33 CLASS:386-P52` [ENTER HERE](https://d1keblit8bqr67.cloudfront.net)
---                                                            
#### Advices:
1. For good performance prefer desktop browser 
2. If you die (you will) use the browser reload [F5]
3. For ultimate performance use NVIDIA Ampere A100 80Gb GPU
4. We recommend the US-Army TEXTRON MARINE 5749739-023 Data Entry command keyboard
---
#### Controls: 
<ins>Advanced multidimensional handling techniques during combat</ins>
1. Hold up arrow to `move up` :arrow_up:
2. Hold down arrow to `move down` :arrow_down:
3. You need to bounce off the thermonuclear plasma bomb
----------

<br></br>
<br></br>

<h3>Sobre o game :joystick:</h3>

Este jogo foi criado com o intuito de testar e aperfeiçoar habilidades nos seguintes tópicos: lógica de programação, JavaScript, administração de redes, Docker, Kubernetes, AWS CLI e deployment pipeline. O desenvolvimento partiu do zero, incialmente com um esboço no Scratch (scratch.mit.edu), depois continuado em JavaScript e, por fim, convertido para HTML. Em seguida foi provisionada a infraestrutura necessária para simular um ambiente de produção. E por último um pipeline ativado por push ou pull request no main branch foi criado, automatizando desde o processo de build e push da imagem da aplicação até seu deploy na infra da AWS. Qualquer alteração neste repositório cria um workflow no GitHub Actions; em poucos minutos o game está atualizado para os usuários.</br>
  </br>
O link acima ("Enter Here") acessa um cluster ECS na AWS. Um application load balancer aponta para o service que, por meio da task definition configurada, utiliza a imagem mais recente da aplicação encontrada no repositório ECR para executar 3 tarefas, sendo que cada uma sobe um container. Buscando otimizar a segurança e a entrega, o load balancer só pode ser alcançado via CloudFront, que encaminha as solicitações com um cabeçalho HTTP customizado (a ausência do header retorna o status code 403).Um detalhe importante é que na task definition a hostPort deve ficar vazia se a intenção for executar diversos containers em uma mesma instância EC2. Segue um resumo das etapas de configuração (2. e 4. são reconfiguradas pelo pipeline):

1. Infra Cluster ECS - Redes e instâncias (posteriormente editáveis via Launch Templates e Auto Scaling Groups)</br>
2. ECS Task Definition - Parâmetros dos containers (imagem, portas, ambiente da aplicação, monitoramento)</br>
3. Application Load Balancer - Security groups, target group (vazio - posteriormente preenchido pelo Service)</br>
4. Cluster Service - Definições para execução das tarefas (vincular load balancer para distribuir tráfego)</br>
---

```
Dockerfile

FROM nginx:1.22
WORKDIR /usr/share/nginx/html/
COPY ./diretorio-arquivos/ .
ARG PORT_BUILD=80
ENV PORT=$PORT_BUILD
EXPOSE $PORT_BUILD
``` 
  </br>
  </br>
  </br>
