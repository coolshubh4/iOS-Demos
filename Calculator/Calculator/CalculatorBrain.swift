//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Shubham Tripathi on 10/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import Foundation

class CalculatorBrain {

    private enum Op: Printable {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand): return "\(operand)"
                case .UnaryOperation(let symbol, _): return symbol
                case .BinaryOperation(let symbol, _): return symbol
                }
            }
        }
        
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String: Op]()
    
    init() {
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        
        //Binary Operations
        learnOp(Op.BinaryOperation("×", *))
        learnOp(Op.BinaryOperation("+", +))
        learnOp(Op.BinaryOperation("÷") {$1 / $0})
        learnOp(Op.BinaryOperation("−") {$1 - $0})
        
        //Unary Operations
        learnOp(Op.UnaryOperation("√", sqrt))
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand): return (operand, remainingOps)
                
            case .UnaryOperation(_, let operation):
                let opEvaluation = evaluate(remainingOps)
                if let operand = opEvaluation.result {
                    return (operation(operand), opEvaluation.remainingOps)
            }
                
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluate = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluate.result {
                        return (operation(operand1, operand2), op2Evaluate.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        println("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
    
    func resetOpStack() -> Bool {
        opStack.removeAll(keepCapacity: false)
        evaluate()
        return true
    }
    
    func popOpStack() -> Bool {
        opStack.removeLast()
        evaluate()
        return true
    }
}