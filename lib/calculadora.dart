import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _display = '0'; 
  String _currentInput = ''; 
  double _result = 0; 
  String _operator = ''; 

  void _pressionarBotao(String valor) {
    setState(() {
      if (RegExp(r'[0-9]').hasMatch(valor)) {
        _currentInput += valor;
        _display = _currentInput;
      } else if (valor == 'C') {
        _display = '0';
        _currentInput = '';
        _result = 0;
        _operator = '';
      } else if (valor == '=') {
        if (_currentInput.isNotEmpty && _operator.isNotEmpty) {
          double num = double.tryParse(_currentInput) ?? 0;
          _result = _calcular(_result, num, _operator);
          _display = _result.toString();
          _currentInput = '';
          _operator = '';
        }
      } else {
        if (_currentInput.isNotEmpty) {
          double num = double.tryParse(_currentInput) ?? 0;
          if (_result == 0) {
            _result = num;
          } else {
            _result = _calcular(_result, num, _operator);
          }
          _operator = valor;
          _currentInput = '';
          _display = _result.toString();
        }
      }
    });
  }

  double _calcular(double num1, double num2, String operador) {
    switch (operador) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num2 != 0 ? num1 / num2 : double.nan;
      default:
        return num1;
    }
  }

  Widget _botao(String valor, {Color? color}) {
    return TextButton(
      onPressed: () => _pressionarBotao(valor),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: color ?? Colors.grey[200],
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        valor,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.black12,
            child: Text(
              _display,
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: GridView.count(
            crossAxisCount: 4,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              _botao('7'),
              _botao('8'),
              _botao('9'),
              _botao('/', color: Colors.orange),
              _botao('4'),
              _botao('5'),
              _botao('6'),
              _botao('*', color: Colors.orange),
              _botao('1'),
              _botao('2'),
              _botao('3'),
              _botao('-', color: Colors.orange),
              _botao('C', color: Colors.red),
              _botao('0'),
              _botao('=', color: Colors.green),
              _botao('+', color: Colors.orange),
            ],
          ),
        ),
      ],
    );
  }
}
