# Diseño del divisor 

## Diagrama de flujo

### Primera version

![Diagrama de flujo v1](Dig_fluj.jpg)

Aunque este diagrama de flujo era funcional, se observa que la repeticion del corrimiento de la variable R por tanto se modifica para que la accion solo se de en un lugar.

### Version final

![Diagrama de flujo vf](divi_final_DF.jpg)

## Caja negra y Datapath

![Camino de datos y Caja](Caj_N_Datapath.jpg)
No se habia realizado la caja negra y se identificaron algunas señales ambiguas

### Version final
![Camino de datos y Caja](Caj_N_Datapath_F.jpg)
	
## Diagrama de estados

![Diagrama de estados](Estados_div.jpg)
Se pensaba en realizar la carga de los numeros y el de Ac con la misma señal sin embargo al intertar implementarlo se dieron muchos problemas por lo cual se decidio serapar esta señal 

### Version final
![Diagrama de estados](Estados_div_F.jpg)
## Simulación 

![Simulación ](Core/Divi_señales.png)
