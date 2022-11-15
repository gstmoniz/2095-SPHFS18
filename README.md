<p align="center">
  <img src="https://d1mf66us61usti.cloudfront.net/image-git3.png">
</p>

<h4>Welcome to year 2095. We are now living inside space-cities around 3.8 lightyears from Earth since our planet was completely dominated by Pluto's cyborg chimpanzees. We're also, as you should know, in the middle of the Fifth Suprasupercluster War.</h4>

<h4>Feel the rush of being part of the acclaimed SPHFS/18 - Special Plasma Heavy Force Squad 18, and save us from the terrifying Y-23A Zorg, a mach-80 strobotic hypersonic magnetic cannon weapon. And remember: you can always be a SIGMA! :medal_military:</h4>

---                                                             
### `OPERATION: ALPHA-BRAVO S4-DELTA/113-15 LMS33 CLASS:386-P52` [ENTER HERE](http://ecs-load-balancer-153755951.us-east-1.elb.amazonaws.com) :sparkle:
---                                                            
#### ADVICES:
###### 1. FOR GOOD PERFORMANCE PREFER DESKTOP BROWSER 
###### 2. IF YOU DIE (YOU WILL) USE THE BROWSER RELOAD [F5]
###### 3. FOR ULTIMATE PERFORMANCE USE NVIDIA AMPERE A100 80GB GPU
###### 4. WE RECOMMEND THE US-ARMY TEXTRON MARINE 5749739-023 DATA ENTRY COMMAND KEYBOARD
---
#### CONTROLS: 
###### <ins>ADVANCED DIMENSIONAL HANDLING TECHNIQUES DURING COMBAT</ins>
###### 1. HOLD UP ARROW TO `move up` :arrow_up:
###### 2. HOLD DOWN ARROW TO `move down` :arrow_down:
###### (YOU NEED TO BOUNCE OFF THE THERMONUCLEAR PLASMA BOMB)
----------

<br></br>
<br></br>
<br></br>
<br></br>

<h3>Sobre o game! :joystick:</h3>

<h4>O jogo foi desenvolvido com o propósito de testar e aperfeiçoar habilidades nas seguintes áreas: lógica de programação, linguagem JavaScript, criação de imagens e orquestração de containers, gerenciamento de serviços na AWS via CLI e conceitos de adminstração de redes. Foi criado do zero, incialmente com um esboço no Scratch (scratch.mit.edu), depois continuado em JavaScript e, por fim, convertido para HTML.</h4>

<h4>O link acima acessa um cluster ECS da AWS. Um application load balancer aponta para o service que, por meio da task definition configurada, utiliza a imagem mais recente da aplicação (sphfs:1.6) encontrada no repositório ECR para executar 3 tarefas, sendo que cada uma sobe um container. Um detalhe importante é que na task definition a hostPort deve ficar vazia se a intenção for executar diversos containers em uma mesma instância EC2. Etapas de configuração:</h4>

###### &emsp;&emsp; 1. Infra Cluster ECS - Redes e instâncias (posteriormente editáveis via Launch Templates e Auto Scaling Groups).
###### &emsp;&emsp; 2. ECS Task Definition - Parâmetros dos containers (imagem, portas, ambiente da aplicação, monitoramento).
###### &emsp;&emsp; 3. Application Load Balancer - Security groups, target group (vazio - posteriormente preenchido pelo Service).
###### &emsp;&emsp; 4. Cluster Service - Definições para execução das tarefas (vincular load balancer para distribuir tráfego).

---
#### Exemplo de Dockerfile:
```
FROM nginx:1.22
WORKDIR /usr/share/nginx/html/
COPY ./diretorio-arquivos/ .
ARG PORT_BUILD=80
ENV PORT=$PORT_BUILD
EXPOSE $PORT_BUILD
``` 

<br></br>
----------
<h4>Opcionalmente, apenas para fins de estudo, o game também está acessível através do link:</h4>

https://d1unfa8m5hmyxg.cloudfront.net/index.html

<h4>Nesse caso aponta novamente para um load balancer, mas que tem como target group instâncias EC2 gerenciadas por política de auto scaling vertical, usando como base uma AMI construída para a aplicação. Por fim, buscando otimizar a entrega para comparar com a situação anterior, o load balancer só pode ser alcançado via CloudFront, que encaminha as solicitações com um cabeçalho HTTP customizado. Solicitações sem o cabeçalho são descartadas por regra.</h4>
