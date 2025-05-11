/// Este é o ponto de entrada da aplicação Flutter.
///
/// Sua responsabilidade principal é iniciar a execução do app chamando `runApp()`
/// com o widget raiz da aplicação, neste caso o [AppInitializer].
///
/// O [AppInitializer] é responsável por configurar dependências iniciais, como
/// o tema da aplicação, provedores de estado e qualquer outra configuração necessária
/// antes de renderizar a interface principal do usuário.

library;

import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/bootstrap/app_initializer.dart';

/// Função principal que inicializa a aplicação.
void main() => runApp(const AppInitializer());
