<p align="center">
  <img src="https://d1mf66us61usti.cloudfront.net/image-git3.png">
</p>

Welcome to year 2095. We are now living inside space-cities around 3.8 lightyears from Earth since our planet was completely dominated by Pluto's cyborg chimpanzees. We're also, as you should know, in the middle of the Fifth Suprasupercluster War.</br>
  </br>
Feel the rush of being part of the acclaimed SPHFS/18 - Special Plasma Heavy Force Squad 18, and save us from the terrifying Y-23A Zorg, a mach-80 strobotic hypersonic magnetic cannon weapon. And remember: you can always be a SIGMA! :medal_military:

---                                                             
### `OPERATION: ALPHA-BRAVO S4-DELTA/113-15 LMS33 CLASS:386-P52` [ENTER HERE](http://ecs-load-balancer-153755951.us-east-1.elb.amazonaws.com)
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

O jogo foi desenvolvido com o propósito de testar e aperfeiçoar habilidades nas seguintes áreas: lógica de programação, linguagem JavaScript, criação de imagens e orquestração de containers, gerenciamento de serviços na AWS via CLI e conceitos de adminstração de redes. Foi criado do zero, incialmente com um esboço no Scratch (scratch.mit.edu), depois continuado em JavaScript e, por fim, convertido para HTML.</br>
  </br>
O link acima acessa um cluster ECS da AWS. Um application load balancer aponta para o service que, por meio da task definition configurada, utiliza a imagem mais recente da aplicação (sphfs:1.6) encontrada no repositório ECR para executar 3 tarefas, sendo que cada uma sobe um container. Um detalhe importante é que na task definition a hostPort deve ficar vazia se a intenção for executar diversos containers em uma mesma instância EC2. Etapas de configuração:

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
  
Opcionalmente, apenas para fins de estudo, o game também está acessível através do link:

https://d1unfa8m5hmyxg.cloudfront.net/index.html

Nesse caso aponta novamente para um load balancer, mas que tem como target group instâncias EC2 gerenciadas por política de auto scaling vertical, usando como base uma AMI construída para a aplicação. Por fim, buscando otimizar a entrega para comparar com a situação anterior, o load balancer só pode ser alcançado via CloudFront, que encaminha as solicitações com um cabeçalho HTTP customizado. Solicitações sem o cabeçalho são descartadas por regra.
