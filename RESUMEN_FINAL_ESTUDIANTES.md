# Resumen final de revisión — Digital I, Grupo 4

**Fecha de corte:** 17 de julio de 2026  
**Fecha de revisión:** 21 de julio de 2026

## Convenciones

- Algoritmos: contador de unos, multiplicador, divisor, raíz cuadrada, binario a decimal/BCD y decimal/BCD a binario.
- Criterios: **1)** caja negra, **2)** diagrama de flujo, **3)** camino de datos, **4)** control/FSM, **5)** diagrama conjunto, **6)** top RTL, **7)** testbench por módulo y **8)** Makefile.
- **C:** confirmado; **P:** parcial; **NC:** no confirmado; **NE:** no evaluable.
- El cálculo de paridad basado en contar los bits en uno y entregar el bit 0 del conteo se acepta como aplicación válida del contador de unos.
- Código 0 en un smoke test confirma compilación y terminación, no corrección funcional si el testbench carece de verificaciones.
- No se ejecutaron Makefiles ni scripts de estudiantes. Los indicadores de similitud o IA no prueban por sí solos una falta académica.

## Regla temporal

Penalización recomendada de **−20 %** sólo cuando toda la actividad relevante comenzó dentro de los 14 días finales, desde el 7 de julio de 2026 UTC. La concentración final no se penaliza si existe actividad anterior.

## Resumen general

- Estudiantes: **41**.
- Repositorios revisados: **35**.
- No evaluables por acceso o contenido vacío: **6**.
- Con los seis tops RTL localizados: **8**.
- Con penalización temporal recomendada: **1**.

---

## 1. Estudiante 1031803236

- **Repositorio:** [Marute0/Electr-nica-Digital-I---Bitacora](https://github.com/Marute0/Electr-nica-Digital-I---Bitacora)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=24, P=2, NC=22, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Calculadora/rtl/cores/bit_paridad/bit_paridad.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `Calculadora/rtl/cores/multiplicador/mult.v` | C: 2,3,4,6,8; P: 7; NC: 1,5 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Calculadora/rtl/cores/Divisor/div.v` | C: 3,6,7,8; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `Calculadora/rtl/cores/Root/root.v` | C: 3,6,7,8; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **C** | `Calculadora/rtl/cores/bin2bcd/bin2bcd.v` | C: 3,6,7,8; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **C** | `Calculadora/rtl/cores/bcd2bin/bcd2bin.v` | C: 3,6,7,8; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 6 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 51 commits relevantes; 24 días activos; 11.8 % en los 14 días finales; primera fecha 2026-02-12T14:10:41+00:00; última 2026-07-12T05:08:26+00:00.
- **Penalización temporal:** **0 %**.

---

## 2. Estudiante 1005300281

- **Repositorio:** [dcastanez/digital_-g8_2026_1-](https://github.com/dcastanez/digital_-g8_2026_1-)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **4/6**.
- **48 criterios:** C=8, P=9, NC=31, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `MULTIPLICADOR/MULT.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `DIVISOR/DIV.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `SQRT/SQRT.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **P** | `BIN_BCD/BIN_BCD.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 2 terminaron con código 0; 2 fallaron; 0 tuvieron error del runner; 2 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 94 commits relevantes; 16 días activos; 23.4 % en los 14 días finales; primera fecha 2026-02-12T12:42:36+00:00; última 2026-07-16T15:41:13+00:00.
- **Penalización temporal:** **0 %**.

---

## 3. Estudiante 1014979246

- **Repositorio:** [epachecob/Esteban-Pacheco-Digital-1](https://github.com/epachecob/Esteban-Pacheco-Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=2, P=0, NC=46, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | C: 2,4; NC: 1,3,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 7 commits relevantes; 5 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-12T13:07:08+00:00; última 2026-04-20T00:29:27+00:00.
- **Penalización temporal:** **0 %**.

---

## 4. Estudiante 1011201981

- **Repositorio:** [Miguelangel88890/Digital-1](https://github.com/Miguelangel88890/Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=15, P=9, NC=24, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `verilog/Calculadora_M/Bit_Paridad/paridad_M.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `verilog/Calculadora_M/multiplicador_M/multiplicador_32_M.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `verilog/Calculadora_M/divisor_M/perip_divisor_M.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `verilog/Calculadora_M/raiz_Cuadrada_M/raizCuadrada_32_M.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **C** | `verilog/Calculadora_M/binToBCD_M/binToBCD_M.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **C** | `verilog/Calculadora_M/BCDTobin_M/BCDTobin_M.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 5 fallaron; 0 tuvieron error del runner; 1 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 45 commits relevantes; 25 días activos; 26.7 % en los 14 días finales; primera fecha 2026-02-12T14:28:00+00:00; última 2026-07-16T02:21:38+00:00.
- **Penalización temporal:** **0 %**.

---

## 5. Estudiante 1025525548

- **Repositorio:** [jrubianov1025/Electronica_Digital_1](https://github.com/jrubianov1025/Electronica_Digital_1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **5/6**.
- **48 criterios:** C=12, P=3, NC=33, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | C: 7,8; NC: 1,2,3,4,5,6 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `calculadora/rtl/cores/Multiplicador/TOP_Multiplicador.v` | C: 3,6; P: 7; NC: 1,2,4,5,8 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `calculadora/rtl/cores/Divisor/Top_Divisor.v` | C: 3,6; P: 7; NC: 1,2,4,5,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `calculadora/rtl/cores/raiz/RAIZ.v` | C: 3,6; P: 7; NC: 1,2,4,5,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **P** | `calculadora/rtl/cores/Binario_BCD/Top_Binario_BCD.v` | C: 3,6; NC: 1,2,4,5,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **P** | `calculadora/rtl/cores/BCD_Binario/Top_BCD_Binario.v` | C: 3,6; NC: 1,2,4,5,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 2 fallaron; 0 tuvieron error del runner; 4 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 42 commits relevantes; 19 días activos; 21.4 % en los 14 días finales; primera fecha 2026-02-10T13:30:39+00:00; última 2026-07-16T20:58:13+00:00.
- **Penalización temporal:** **0 %**.

---

## 6. Estudiante 1014737741

- **Repositorio:** [ALELOY257/trabajo-individual-Dig-I](https://github.com/ALELOY257/trabajo-individual-Dig-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **5/6**.
- **48 criterios:** C=17, P=7, NC=24, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `calc/paridad/paridad_top.v` | C: 2,8; P: 6,7; NC: 1,3,4,5 | Se encontró una función de paridad, pero no un camino de datos que cuente los unos. |
| Multiplicador | **C** | `calc/mult/mult_top.v` | C: 2,6,8; P: 7; NC: 1,3,4,5 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `calc/div/div_top.v` | C: 2,6,8; P: 7; NC: 1,3,4,5 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `calc/sqrt/sqrt_top.v` | C: 2,6,8; P: 7; NC: 1,3,4,5 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **C** | `calc/bin2bcd/bin2bcd_top.v` | C: 2,6,8; P: 7; NC: 1,3,4,5 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **C** | `calc/bcd2bin/bcd2bin_top.v` | C: 2,6,8; P: 7; NC: 1,3,4,5 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 5 fallaron; 0 tuvieron error del runner; 1 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 41 commits relevantes; 27 días activos; 9.8 % en los 14 días finales; primera fecha 2026-02-12T12:18:44+00:00; última 2026-07-14T13:39:53+00:00.
- **Penalización temporal:** **0 %**.

---

## 7. Estudiante 1123435251

- **Repositorio:** [dquirogav-code/Digital-David-quiroga](https://github.com/dquirogav-code/Digital-David-quiroga)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=26, P=6, NC=16, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Paridad/Paridad_9/Paridad_Top.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `multiplicador/mult_32/Mul_Top.v` | C: 1,2,3,4,6,8; P: 7; NC: 5 | Revisión manual confirmada. |
| Divisor | **C** | `division/div_32/Div_TOP.v` | C: 1,3,4,6,8; P: 7; NC: 2,5 | Revisión manual confirmada. |
| Raíz cuadrada | **C** | `raiz/raiz_32/Raiz_TOP.v` | C: 1,2,3,4,6,8; P: 7; NC: 5 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **C** | `bcd/bin2bcd/BCD_Top.v` | C: 6,8; P: 7; NC: 1,2,3,4,5 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **C** | `bcd2bin/bcd2bin32/BCDBIN_TOP.v` | C: 3,4,6,8; P: 7; NC: 1,2,5 | Revisión manual confirmada. |

- **Pruebas seguras:** 5 terminaron con código 0; 1 fallaron; 0 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** Coincidencias estructurales con cores de referencia; requieren revisión manual y no prueban por sí solas una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 85 commits relevantes; 11 día activo; 62.4 % en los 14 días finales; primera fecha 2026-02-12T16:56:25+00:00; última 2026-07-17T18:33:08+00:00.
- **Penalización temporal:** **0 %**.

---

## 8. Estudiante 1010166751

- **Repositorio:** [OscarMurillol/Digital-1.2-2026-1](https://github.com/OscarMurillol/Digital-1.2-2026-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=2, P=7, NC=39, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **NC** | `—` | C: 8; P: 5,7; NC: 1,2,3,4,6 | Revisión manual confirmada. |
| Divisor | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Revisión manual confirmada. |
| Raíz cuadrada | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **NC** | `—` | C: 8; P: 5,7; NC: 1,2,3,4,6 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 28 commits relevantes; 8 días activos; 50.0 % en los 14 días finales; primera fecha 2026-02-12T20:15:35+00:00; última 2026-07-17T03:53:04+00:00.
- **Penalización temporal:** **0 %**.

---

## 9. Estudiante 1013113410

- **Repositorio:** [JesusCespedes-Sus/E_Digital](https://github.com/JesusCespedes-Sus/E_Digital)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=21, P=6, NC=21, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Paridad/Paridad_9/Paridad_Top.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `Multiplicador/Mult_32/Mul_Top.v` | C: 3,4,6,8; P: 7; NC: 1,2,5 | Revisión manual confirmada. |
| Divisor | **C** | `División/Div_32/Div_TOP.v` | C: 4,6,8; P: 7; NC: 1,2,3,5 | Revisión manual confirmada. |
| Raíz cuadrada | **C** | `Raiz/Raiz_32/Raiz_TOP.v` | C: 3,4,6,8; P: 7; NC: 1,2,5 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **C** | `BCD/BINtoBCD_32/BCD_Top.v` | C: 3,4,6,8; P: 7; NC: 1,2,5 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **C** | `BCD/BCDtoBIN_32/BCDBIN_TOP.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Revisión manual confirmada. |

- **Pruebas seguras:** 4 terminaron con código 0; 2 fallaron; 0 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** Coincidencias estructurales con cores de referencia; requieren revisión manual y no prueban por sí solas una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 61 commits relevantes; 19 días activos; 37.7 % en los 14 días finales; primera fecha 2026-02-12T21:34:54+00:00; última 2026-07-17T18:14:53+00:00.
- **Penalización temporal:** **0 %**.

---

## 10. Estudiante 1014978946

- **Repositorio:** [dzorro-code/Calculadora-David-Zorro](https://github.com/dzorro-code/Calculadora-David-Zorro)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **3/6**.
- **48 criterios:** C=7, P=9, NC=32, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `calculator/cores/mult/mult.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `calculator/cores/div/div.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `calculator/cores/sqrt/sqrt.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | C: 8; P: 5,7; NC: 1,2,3,4,6 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 3 terminaron con código 0; 3 fallaron; 0 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Alta concentración final; hubo actividad anterior. 17 commits relevantes; 8 días activos; 82.4 % en los 14 días finales; primera fecha 2026-07-03T23:39:19+00:00; última 2026-07-17T03:51:43+00:00.
- **Penalización temporal:** **0 % bajo la regla estricta**.

---

## 11. Estudiante 1053442496

- **Repositorio:** [JJmonsa/Digital-1-2026-1s](https://github.com/JJmonsa/Digital-1-2026-1s)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=18, P=4, NC=26, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Entrega_Final/paridad/onesCount.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Implementación explícita del contador de unos con salida de conteo. |
| Multiplicador | **C** | `Entrega_Final/multiplicador/multiplicador.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Revisión manual confirmada. |
| Divisor | **C** | `Entrega_Final/divisor/divisor.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Revisión manual confirmada. |
| Raíz cuadrada | **C** | `Entrega_Final/raiz/raiz.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **C** | `Entrega_Final/bin_bcd/bin2bcd.v` | C: 6,7,8; NC: 1,2,3,4,5 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **C** | `Entrega_Final/bcd_bin/bcd_bin.v` | C: 6,7,8; NC: 1,2,3,4,5 | Revisión manual confirmada. |

- **Pruebas seguras:** 6 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Alta concentración final; hubo actividad anterior. 6 commits relevantes; 4 días activos; 83.3 % en los 14 días finales; primera fecha 2026-02-13T03:46:13+00:00; última 2026-07-16T17:57:29+00:00.
- **Penalización temporal:** **0 % bajo la regla estricta**.

---

## 12. Estudiante 1014658307

- **Repositorio:** [daortizca/Electronica-digital](https://github.com/daortizca/Electronica-digital)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=20, P=6, NC=22, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Algoritmos/Paridad/core/paridad.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `Algoritmos/multiplicador/Core/mult.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Algoritmos/division/Core/div.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `Algoritmos/Raiz_Cuadrada/Core/raiz.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **P** | `Algoritmos/binario_bcd/Core/bin_to_bcd.v` | C: 1,3,6,8; P: 7; NC: 2,4,5 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **P** | `Algoritmos/bcd_binario/Core/bcd_to_bin.v` | C: 1,3,6,8; P: 7; NC: 2,4,5 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 1 terminaron con código 0; 4 fallaron; 0 tuvieron error del runner; 1 no se ejecutaron.
- **Similitud:** Coincidencias estructurales con cores de referencia; requieren revisión manual y no prueban por sí solas una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 330 commits relevantes; 27 días activos; 63.9 % en los 14 días finales; primera fecha 2026-02-12T23:53:59+00:00; última 2026-07-16T21:06:05+00:00.
- **Penalización temporal:** **0 %**.

---

## 13. Estudiante 1233902358

- **Repositorio:** [AlfredoNavarro1765/Algoritmo_Multiplicacion_dos_binarios](https://github.com/AlfredoNavarro1765/Algoritmo_Multiplicacion_dos_binarios)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=48, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 2 commits relevantes; 1 día activo; 0.0 % en los 14 días finales; primera fecha 2026-02-13T00:13:46+00:00; última 2026-02-13T00:14:59+00:00.
- **Penalización temporal:** **0 %**.

---

## 14. Estudiante 1011088721

- **Repositorio:** [vcarreno52/Multiplicador-binarios](https://github.com/vcarreno52/Multiplicador-binarios)
- **Acceso:** Repositorio disponible y revisado — normalized blob URL to repository root
- **Tops RTL:** **0/6**.
- **48 criterios:** C=3, P=1, NC=44, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | C: 4; NC: 1,2,3,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | C: 3,4; NC: 1,2,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 21 commits relevantes; 5 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-12T11:11:04+00:00; última 2026-04-18T17:03:20+00:00.
- **Penalización temporal:** **0 %**.

---

## 15. Estudiante 1010088484

- **Repositorio:** [SebastianGarciaMartinez/Digital_1](https://github.com/SebastianGarciaMartinez/Digital_1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **3/6**.
- **48 criterios:** C=3, P=0, NC=45, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `Calculadora/Multiplicador.v` | C: 6; NC: 1,2,3,4,5,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Calculadora/Divisor.v` | C: 6; NC: 1,2,3,4,5,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `Calculadora/Raiz.v` | C: 6; NC: 1,2,3,4,5,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 60 commits relevantes; 21 día activo; 0.0 % en los 14 días finales; primera fecha 2026-02-20T03:56:09+00:00; última 2026-05-29T20:03:37+00:00.
- **Penalización temporal:** **0 %**.

---

## 16. Estudiante 1011082811

- **Repositorio:** [ggordilloc/Digital-1-Gabriela](https://github.com/ggordilloc/Digital-1-Gabriela)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=1, P=0, NC=47, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | C: 2; NC: 1,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 0 commits relevantes; 0 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-13T01:15:01+00:00; última 2026-02-13T01:15:01+00:00.
- **Penalización temporal:** **0 %**.

---

## 17. Estudiante 1034777711

- **Repositorio:** [MichelleTorresP/Electr-nica-Digital-1](https://github.com/MichelleTorresP/Electr-nica-Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=48, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 1 commits relevantes; 1 día activo; 0.0 % en los 14 días finales; primera fecha 2026-02-13T00:42:42+00:00; última 2026-02-13T00:42:42+00:00.
- **Penalización temporal:** **0 %**.

---

## 18. Estudiante 1013581026

- **Repositorio:** [sandr4AB/Electr-nica-Digital-I-](https://github.com/sandr4AB/Electr-nica-Digital-I-)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **2/6**.
- **48 criterios:** C=4, P=4, NC=40, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `TAREAS/Test_perifericos/Contador_unos/contador_unos.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Implementación explícita del contador de unos con acumulador interno. |
| Multiplicador | **C** | `TAREAS/Test_perifericos/Multiplicador/module_multi.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 1 fallaron; 0 tuvieron error del runner; 5 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 36 commits relevantes; 8 días activos; 11.1 % en los 14 días finales; primera fecha 2026-02-12T23:53:31+00:00; última 2026-07-16T18:24:44+00:00.
- **Penalización temporal:** **0 %**.

---

## 19. Estudiante 1010064600

- **Repositorio:** No suministrado
- **Acceso:** Repositorio no disponible; no evaluable — no se suministró una URL
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 20. Estudiante 1091355683

- **Repositorio:** [Nic0l4g/Electronica-Digital-1](https://github.com/Nic0l4g/Electronica-Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=4, P=0, NC=44, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | C: 3,4; NC: 1,2,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | C: 1,2; NC: 3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 1 commits relevantes; 1 día activo; 0.0 % en los 14 días finales; primera fecha 2026-03-05T05:54:32+00:00; última 2026-03-05T05:54:32+00:00.
- **Penalización temporal:** **0 %**.

---

## 21. Estudiante 1022931354

- **Repositorio:** [Edyson-Vargas/Electr-nica-Digital-I](https://github.com/Edyson-Vargas/Electr-nica-Digital-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **3/6**.
- **48 criterios:** C=6, P=7, NC=35, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `iverilog_multi/module_multi.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `iverilog_divi/module_divi.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `iverilog_raiz/module_raiz.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 1 terminaron con código 0; 2 fallaron; 0 tuvieron error del runner; 3 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 12 commits relevantes; 7 días activos; 33.3 % en los 14 días finales; primera fecha 2026-04-30T14:50:57+00:00; última 2026-07-16T18:10:47+00:00.
- **Penalización temporal:** **0 %**.

---

## 22. Estudiante 1012916494

- **Repositorio:** [Asanchezrod21/Multiplicador-Binario](https://github.com/Asanchezrod21/Multiplicador-Binario)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=1, NC=47, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 1 commits relevantes; 1 día activo; 0.0 % en los 14 días finales; primera fecha 2026-02-13T02:14:51+00:00; última 2026-02-13T02:18:39+00:00.
- **Penalización temporal:** **0 %**.

---

## 23. Estudiante 1023372486

- **Repositorio:** [jrinconag/Digital-I](https://github.com/jrinconag/Digital-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **4/6**.
- **48 criterios:** C=10, P=10, NC=28, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Modulos/Paridad/perip_paridad.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `Modulos/Multiplicador/multiplicador.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Modulos/Divisor/perip_div.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `Modulos/Raiz/raiz_32.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | C: 8; P: 7; NC: 1,2,3,4,5,6 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | C: 8; P: 7; NC: 1,2,3,4,5,6 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 3 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 3 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Alta concentración final; hubo actividad anterior. 48 commits relevantes; 10 días activos; 85.4 % en los 14 días finales; primera fecha 2026-02-13T02:46:24+00:00; última 2026-07-17T03:53:28+00:00.
- **Penalización temporal:** **0 % bajo la regla estricta**.

---

## 24. Estudiante 1013099753

- **Repositorio:** [Marto4/Digital](https://github.com/Marto4/Digital)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **2/6**.
- **48 criterios:** C=8, P=1, NC=39, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `Multiplicador/multi.v` | C: 6,7,8; NC: 1,2,3,4,5 | Localización automática; requiere revisión funcional. |
| Divisor | **P** | `Divisor/Divisor.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | C: 7,8; NC: 1,2,3,4,5,6 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 2 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 4 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Trabajo únicamente en las dos semanas finales. 9 commits relevantes; 1 día activo; 100.0 % en los 14 días finales; primera fecha 2026-07-16T14:42:26+00:00; última 2026-07-16T15:08:31+00:00.
- **Penalización temporal:** **−20 % recomendado**.

---

## 25. Estudiante 1000241616

- **Repositorio:** [JysusCrack2321/Digital-1](https://github.com/JysusCrack2321/Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=48, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 1 commits relevantes; 1 día activo; 0.0 % en los 14 días finales; primera fecha 2026-02-15T22:15:53+00:00; última 2026-02-15T22:15:53+00:00.
- **Penalización temporal:** **0 %**.

---

## 26. Estudiante 1034776752

- **Repositorio:** [luisamariag/digital1-entregas](https://github.com/luisamariag/digital1-entregas)
- **Acceso:** Repositorio disponible y revisado — normalized blob URL to repository root
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=3, NC=45, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 7 commits relevantes; 2 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-16T03:14:30+00:00; última 2026-04-21T13:15:30+00:00.
- **Penalización temporal:** **0 %**.

---

## 27. Estudiante 1013703137

- **Repositorio:** [ijordan-svg/Electronica_Digital_I](https://github.com/ijordan-svg/Electronica_Digital_I)
- **Acceso:** No fue posible acceder al repositorio; no evaluable — el repositorio requiere autenticación o no permite clonación pública
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 28. Estudiante 1003845024

- **Repositorio:** [ChevisebasBP/Digital-1](https://github.com/ChevisebasBP/Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=16, P=6, NC=26, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Contador_de_Unos/Contador_Unos.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Implementación explícita del contador de unos con acumulador interno. |
| Multiplicador | **C** | `Calculadora/rtl/Cores/Multiplicador/TOP_Multiplicador.v` | C: 3,6; P: 7; NC: 1,2,4,5,8 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Calculadora/rtl/Cores/Divisor/TOP_Divisor.v` | C: 3,6; P: 7; NC: 1,2,4,5,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **P** | `Calculadora/rtl/Cores/Raiz/TOP_Raiz.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **P** | `Calculadora/rtl/Cores/Binario_BCD/TOP_BinarioBCD.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **P** | `Calculadora/rtl/Cores/BCD_Binario/TOP_BCDbinario.v` | C: 3,6,8; P: 7; NC: 1,2,4,5 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 3 terminaron con código 0; 1 fallaron; 0 tuvieron error del runner; 2 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 35 commits relevantes; 8 días activos; 5.7 % en los 14 días finales; primera fecha 2026-02-16T10:14:31+00:00; última 2026-07-16T09:21:12+00:00.
- **Penalización temporal:** **0 %**.

---

## 29. Estudiante 1000624739

- **Repositorio:** [bmunozsd/Digital-I](https://github.com/bmunozsd/Digital-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=3, NC=45, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 8 commits relevantes; 3 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-16T13:37:56+00:00; última 2026-03-12T12:34:54+00:00.
- **Penalización temporal:** **0 %**.

---

## 30. Estudiante 1121833806

- **Repositorio:** [EmanuelBejaranoG719/Digital-1-2026](https://github.com/EmanuelBejaranoG719/Digital-1-2026)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **4/6**.
- **48 criterios:** C=29, P=5, NC=14, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **C** | `multiplier.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Divisor | **C** | `top_div.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Raíz cuadrada | **C** | `top_sqrt.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **C** | `top_bin2bcd.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | C: 8; P: 7; NC: 1,2,3,4,5,6 | Revisión manual confirmada. |

- **Pruebas seguras:** 3 terminaron con código 0; 1 fallaron; 0 tuvieron error del runner; 2 no se ejecutaron.
- **Similitud:** Coincidencias estructurales con cores de referencia; requieren revisión manual y no prueban por sí solas una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Alta concentración final; hubo actividad anterior. 17 commits relevantes; 6 días activos; 82.4 % en los 14 días finales; primera fecha 2026-06-19T03:07:46+00:00; última 2026-07-16T21:48:40+00:00.
- **Penalización temporal:** **0 % bajo la regla estricta**.

---

## 31. Estudiante 1000731433

- **Repositorio:** [MaicolLeiton/Maicol-Leiton-Digital-1](https://github.com/MaicolLeiton/Maicol-Leiton-Digital-1)
- **Acceso:** Repositorio vacío; no evaluable — no contiene commits
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 32. Estudiante 1122923631

- **Repositorio:** [MoritaPro/Electronica-Digital-1](https://github.com/MoritaPro/Electronica-Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **1/6**.
- **48 criterios:** C=2, P=0, NC=46, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Divisor | **C** | `divisor.v` | C: 4,6; NC: 1,2,3,5,7,8 | Revisión manual confirmada. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 5 commits relevantes; 2 días activos; 0.0 % en los 14 días finales; primera fecha 2026-04-21T03:32:09+00:00; última 2026-06-09T04:29:15+00:00.
- **Penalización temporal:** **0 %**.

---

## 33. Estudiante 1000615669

- **Repositorio:** [davidsilvar/Electronica-digital-1](https://github.com/davidsilvar/Electronica-digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=12, P=0, NC=36, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **NC** | `—` | C: 1,2,3,4; NC: 5,6,7,8 | Revisión manual confirmada. |
| Divisor | **NC** | `—` | C: 1,2,3,4; NC: 5,6,7,8 | Revisión manual confirmada. |
| Raíz cuadrada | **NC** | `—` | C: 1,2,3,4; NC: 5,6,7,8 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 13 commits relevantes; 5 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-17T04:50:38+00:00; última 2026-04-24T16:44:23+00:00.
- **Penalización temporal:** **0 %**.

---

## 34. Estudiante 1014198651

- **Repositorio:** [dnpenaa/Digital-l](https://github.com/dnpenaa/Digital-l)
- **Acceso:** Repositorio vacío; no evaluable — no contiene commits
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 35. Estudiante 1010010155

- **Repositorio:** [Draig65/Sebastian-Morales-Digital-1](https://github.com/Draig65/Sebastian-Morales-Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **6/6**.
- **48 criterios:** C=46, P=2, NC=0, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **C** | `Algoritmos/Paridad/core/paridad.v` | C: 1,2,3,4,5,6,7,8 | Aplicación válida del contador de unos: calcula el conteo internamente y entrega count[0] como bit de paridad. |
| Multiplicador | **C** | `Algoritmos/multiplicador/Core/mult.v` | C: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Divisor | **C** | `Algoritmos/division/Core/div.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Raíz cuadrada | **C** | `Algoritmos/Raiz_Cuadrada/Core/raiz.v` | C: 1,2,3,4,5,6,8; P: 7 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **C** | `Algoritmos/Binario-BCD/Archivos Verilog/bin_to_bcd.v` | C: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **C** | `Algoritmos/BCD - BINARIO/Archivos Verilog/bcd_to_bin.v` | C: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 2 terminaron con código 0; 3 fallaron; 0 tuvieron error del runner; 1 no se ejecutaron.
- **Similitud:** Coincidencias estructurales con cores de referencia; requieren revisión manual y no prueban por sí solas una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 395 commits relevantes; 30 días activos; 64.8 % en los 14 días finales; primera fecha 2026-02-12T23:53:59+00:00; última 2026-07-16T21:15:40+00:00.
- **Penalización temporal:** **0 %**.

---

## 36. Estudiante 1006679631

- **Repositorio:** [—/—](https://github.com/repos?q=owner%3A%40me)
- **Acceso:** Repositorio no disponible; no evaluable — se suministró una búsqueda genérica de GitHub, no una URL de repositorio
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 37. Estudiante 1000991276

- **Repositorio:** [jortizn-ux/Electr-nica-Digital-I](https://github.com/jortizn-ux/Electr-nica-Digital-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=48, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 10 commits relevantes; 2 días activos; 0.0 % en los 14 días finales; primera fecha 2026-04-23T03:59:22+00:00; última 2026-04-24T03:11:03+00:00.
- **Penalización temporal:** **0 %**.

---

## 38. Estudiante 1121838299

- **Repositorio:** [Dilopezmo/Electronica-Digital-1](https://github.com/Dilopezmo/Electronica-Digital-1)
- **Acceso:** Repositorio vacío; no evaluable — no contiene commits
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=0, NC=0, NE=48.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Multiplicador | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Divisor | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Raíz cuadrada | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Binario → decimal (BCD) | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |
| Decimal (BCD) → binario | **NE** | `—` | NE: 1,2,3,4,5,6,7,8 | No evaluable. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No fue posible evaluar similitud.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** No evaluable. Sin historial.
- **Penalización temporal:** **N/A**.

---

## 39. Estudiante 1044213907

- **Repositorio:** [acortavarria/Digital-1](https://github.com/acortavarria/Digital-1)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **5/6**.
- **48 criterios:** C=11, P=9, NC=28, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **C** | `Modulos/Multiplicador/Multiplicador.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Divisor | **C** | `Modulos/Divisor/Divisor.v` | C: 6,7,8; P: 5; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **C** | `Modulos/RaizCuadrada/RaizCuadrada.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **C** | `Modulos/BintoBcd/BintoBcd.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **C** | `Modulos/BcdtoBin/BcdtoBin.v` | C: 6,8; P: 5,7; NC: 1,2,3,4 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 2 terminaron con código 0; 3 fallaron; 1 tuvieron error del runner; 0 no se ejecutaron.
- **Similitud:** Similitud estructural alta con cores de referencia; requiere revisión docente o sustentación. La métrica por sí sola no prueba una falta académica.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 31 commits relevantes; 13 días activos; 29.0 % en los 14 días finales; primera fecha 2026-02-23T22:59:29+00:00; última 2026-07-17T01:05:05+00:00.
- **Penalización temporal:** **0 %**.

---

## 40. Estudiante 1021393646

- **Repositorio:** [JuanHuertas004/Juan-Huertas-Digital-I](https://github.com/JuanHuertas004/Juan-Huertas-Digital-I)
- **Acceso:** Repositorio disponible y revisado
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=1, NC=47, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Multiplicador | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Divisor | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Localización automática; requiere revisión funcional. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Localización automática; requiere revisión funcional. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** No se encontró evidencia suficiente de copia desde los cores de referencia evaluados.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 2 commits relevantes; 2 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-24T09:30:04+00:00; última 2026-03-03T11:33:21+00:00.
- **Penalización temporal:** **0 %**.

---

## 41. Estudiante 1001198593

- **Repositorio:** [wabohorquezr/Digital](https://github.com/wabohorquezr/Digital)
- **Acceso:** Repositorio disponible y revisado — normalized incomplete blob URL to repository root
- **Tops RTL:** **0/6**.
- **48 criterios:** C=0, P=1, NC=47, NE=0.

| Algoritmo | Estado | Top RTL | Criterios 1–8 | Observación |
|---|---:|---|---|---|
| Contador de unos | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Multiplicador | **NC** | `—` | P: 5; NC: 1,2,3,4,6,7,8 | Revisión manual confirmada. |
| Divisor | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Raíz cuadrada | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Binario → decimal (BCD) | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |
| Decimal (BCD) → binario | **NC** | `—` | NC: 1,2,3,4,5,6,7,8 | Revisión manual confirmada. |

- **Pruebas seguras:** 0 terminaron con código 0; 0 fallaron; 0 tuvieron error del runner; 6 no se ejecutaron.
- **Similitud:** Se encontró una referencia explícita a un tutorial externo; debe citarse y aclararse qué partes fueron adaptadas.
- **IA:** Sin evidencia concluyente de IA. No se confirmó una mención literal válida a ChatGPT/Copilot/LLM en archivos fuente. Estilo, comentarios y detectores automáticos no permiten atribuir autoría con certeza.
- **Commits:** Actividad anterior a las dos semanas finales. 9 commits relevantes; 3 días activos; 0.0 % en los 14 días finales; primera fecha 2026-02-19T11:31:06+00:00; última 2026-04-24T03:57:59+00:00.
- **Penalización temporal:** **0 %**.

---

## Nota final

La revisión se basa en la evidencia disponible. El estudiante puede sustentar su implementación y señalar el archivo o commit correspondiente cuando exista desacuerdo sobre una clasificación, similitud o prueba fallida.
