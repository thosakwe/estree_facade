@JS()
library estree_facade;

import "package:js/js.dart";

/// Type definitions for ESTree AST specification
/// Project: https://github.com/estree/estree
/// Definitions by: RReverser <https://github.com/RReverser>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped

/// This definition file follows a somewhat unusual format. ESTree allows
/// runtime type checks based on the `type` parameter. In order to explain this
/// to typescript we want to use discriminated union types:
/// https://github.com/Microsoft/TypeScript/pull/9163
/// For ESTree this is a bit tricky because the high level interfaces like
/// Node or Function are pulling double duty. We want to pass common fields down
/// to the interfaces that extend them (like Identifier or
/// ArrowFunctionExpression), but you can't extend a type union or enforce
/// common fields on them. So we've split the high level interfaces into two
/// types, a base type which passes down inhereted fields, and a type union of
/// all types which extend the base type. Only the type union is exported, and
/// the union is how other types refer to the collection of inheriting types.
/// This makes the definitions file here somewhat more difficult to maintain,
/// but it has the notable advantage of making ESTree much easier to use as
/// an end user.
@anonymous
@JS()
abstract class BaseNode {
  /// Every leaf interface that extends BaseNode must specify a type property.
  /// The type property should be a string literal. For example, Identifier
  /// has: `type: "Identifier"`
  external List<Comment> get leadingComments;
  external set leadingComments(List<Comment> v);
  external List<Comment> get trailingComments;
  external set trailingComments(List<Comment> v);
  external SourceLocation get loc;
  external set loc(SourceLocation v);
  external List<num> /*Tuple of <num,num>*/ get range;
  external set range(List<num> /*Tuple of <num,num>*/ v);
  external factory BaseNode(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Node =
    Identifier | Literal | Program | Function | SwitchCase | CatchClause |
    VariableDeclarator | Statement | Expression | Property |
    AssignmentProperty | Super | TemplateElement | SpreadElement | Pattern |
    ClassBody | Class | MethodDefinition | ModuleDeclaration | ModuleSpecifier;*/
@anonymous
@JS()
abstract class Comment {
  external String get value;
  external set value(String v);
  external factory Comment({String value});
}

@anonymous
@JS()
abstract class SourceLocation {
  external String get source;
  external set source(String v);
  external Position get start;
  external set start(Position v);
  external Position get end;
  external set end(Position v);
  external factory SourceLocation(
      {String source, Position start, Position end});
}

@anonymous
@JS()
abstract class Position {
  /// >= 1
  external num get line;
  external set line(num v);

  /// >= 0
  external num get column;
  external set column(num v);
  external factory Position({num line, num column});
}

@anonymous
@JS()
abstract class Program implements BaseNode {
  external String /*'Program'*/ get type;
  external set type(String /*'Program'*/ v);
  external String /*'script'|'module'*/ get sourceType;
  external set sourceType(String /*'script'|'module'*/ v);
  external List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration|ImportDeclaration|ExportNamedDeclaration|ExportDefaultDeclaration|ExportAllDeclaration*/ >
      get body;
  external set body(
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration|ImportDeclaration|ExportNamedDeclaration|ExportDefaultDeclaration|ExportAllDeclaration*/ > v);
  external factory Program(
      {String /*'Program'*/ type,
      String /*'script'|'module'*/ sourceType,
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration|ImportDeclaration|ExportNamedDeclaration|ExportDefaultDeclaration|ExportAllDeclaration*/ > body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BaseFunction implements BaseNode {
  external List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ >
      get params;
  external set params(
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > v);
  external bool get generator;
  external set generator(bool v);
  external bool get JS$async;
  external set JS$async(bool v);

  /// The body is either BlockStatement or Expression because arrow functions
  /// can have a body that's either. FunctionDeclarations and
  /// FunctionExpressions have only BlockStatement bodies.
  external dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get body;
  external set body(
      dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory BaseFunction(
      {List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > params,
      bool generator,
      bool JS$async,
      dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Function =
    FunctionDeclaration | FunctionExpression | ArrowFunctionExpression;*/
/*export type Statement =
    ExpressionStatement | BlockStatement | EmptyStatement |
    DebuggerStatement | WithStatement | ReturnStatement | LabeledStatement |
    BreakStatement | ContinueStatement | IfStatement | SwitchStatement |
    ThrowStatement | TryStatement | WhileStatement | DoWhileStatement |
    ForStatement | ForInStatement | ForOfStatement | Declaration;*/
@anonymous
@JS()
abstract class BaseStatement implements BaseNode {
  external factory BaseStatement(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class EmptyStatement implements BaseStatement {
  external String /*'EmptyStatement'*/ get type;
  external set type(String /*'EmptyStatement'*/ v);
  external factory EmptyStatement(
      {String /*'EmptyStatement'*/ type,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BlockStatement implements BaseStatement {
  external String /*'BlockStatement'*/ get type;
  external set type(String /*'BlockStatement'*/ v);
  external List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ >
      get body;
  external set body(
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ > v);
  external factory BlockStatement(
      {String /*'BlockStatement'*/ type,
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ > body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ExpressionStatement implements BaseStatement {
  external String /*'ExpressionStatement'*/ get type;
  external set type(String /*'ExpressionStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get expression;
  external set expression(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ExpressionStatement(
      {String /*'ExpressionStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ expression,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class IfStatement implements BaseStatement {
  external String /*'IfStatement'*/ get type;
  external set type(String /*'IfStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get consequent;
  external set consequent(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get alternate;
  external set alternate(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory IfStatement(
      {String /*'IfStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ consequent,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ alternate,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class LabeledStatement implements BaseStatement {
  external String /*'LabeledStatement'*/ get type;
  external set type(String /*'LabeledStatement'*/ v);
  external Identifier get label;
  external set label(Identifier v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory LabeledStatement(
      {String /*'LabeledStatement'*/ type,
      Identifier label,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BreakStatement implements BaseStatement {
  external String /*'BreakStatement'*/ get type;
  external set type(String /*'BreakStatement'*/ v);
  external Identifier get label;
  external set label(Identifier v);
  external factory BreakStatement(
      {String /*'BreakStatement'*/ type,
      Identifier label,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ContinueStatement implements BaseStatement {
  external String /*'ContinueStatement'*/ get type;
  external set type(String /*'ContinueStatement'*/ v);
  external Identifier get label;
  external set label(Identifier v);
  external factory ContinueStatement(
      {String /*'ContinueStatement'*/ type,
      Identifier label,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class WithStatement implements BaseStatement {
  external String /*'WithStatement'*/ get type;
  external set type(String /*'WithStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get object;
  external set object(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory WithStatement(
      {String /*'WithStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ object,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class SwitchStatement implements BaseStatement {
  external String /*'SwitchStatement'*/ get type;
  external set type(String /*'SwitchStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get discriminant;
  external set discriminant(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external List<SwitchCase> get cases;
  external set cases(List<SwitchCase> v);
  external factory SwitchStatement(
      {String /*'SwitchStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ discriminant,
      List<SwitchCase> cases,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ReturnStatement implements BaseStatement {
  external String /*'ReturnStatement'*/ get type;
  external set type(String /*'ReturnStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ReturnStatement(
      {String /*'ReturnStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ThrowStatement implements BaseStatement {
  external String /*'ThrowStatement'*/ get type;
  external set type(String /*'ThrowStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ThrowStatement(
      {String /*'ThrowStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class TryStatement implements BaseStatement {
  external String /*'TryStatement'*/ get type;
  external set type(String /*'TryStatement'*/ v);
  external BlockStatement get block;
  external set block(BlockStatement v);
  external CatchClause get handler;
  external set handler(CatchClause v);
  external BlockStatement get finalizer;
  external set finalizer(BlockStatement v);
  external factory TryStatement(
      {String /*'TryStatement'*/ type,
      BlockStatement block,
      CatchClause handler,
      BlockStatement finalizer,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class WhileStatement implements BaseStatement {
  external String /*'WhileStatement'*/ get type;
  external set type(String /*'WhileStatement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory WhileStatement(
      {String /*'WhileStatement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class DoWhileStatement implements BaseStatement {
  external String /*'DoWhileStatement'*/ get type;
  external set type(String /*'DoWhileStatement'*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory DoWhileStatement(
      {String /*'DoWhileStatement'*/ type,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ForStatement implements BaseStatement {
  external String /*'ForStatement'*/ get type;
  external set type(String /*'ForStatement'*/ v);
  external dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get init;
  external set init(
      dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get update;
  external set update(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory ForStatement(
      {String /*'ForStatement'*/ type,
      dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ init,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ update,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BaseForXStatement implements BaseStatement {
  external dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get left;
  external set left(
      dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get right;
  external set right(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get body;
  external set body(
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external factory BaseForXStatement(
      {dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ForInStatement implements BaseForXStatement {
  external String /*'ForInStatement'*/ get type;
  external set type(String /*'ForInStatement'*/ v);
  external factory ForInStatement(
      {String /*'ForInStatement'*/ type,
      dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class DebuggerStatement implements BaseStatement {
  external String /*'DebuggerStatement'*/ get type;
  external set type(String /*'DebuggerStatement'*/ v);
  external factory DebuggerStatement(
      {String /*'DebuggerStatement'*/ type,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Declaration =
      FunctionDeclaration | VariableDeclaration | ClassDeclaration;*/
@anonymous
@JS()
abstract class BaseDeclaration implements BaseStatement {
  external factory BaseDeclaration(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class FunctionDeclaration implements BaseFunction, BaseDeclaration {
  external String /*'FunctionDeclaration'*/ get type;
  external set type(String /*'FunctionDeclaration'*/ v);
  external Identifier get id;
  external set id(Identifier v);
  external BlockStatement get body;
  external set body(BlockStatement v);
  external factory FunctionDeclaration(
      {String /*'FunctionDeclaration'*/ type,
      Identifier id,
      BlockStatement body,
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > params,
      bool generator,
      bool JS$async,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class VariableDeclaration implements BaseDeclaration {
  external String /*'VariableDeclaration'*/ get type;
  external set type(String /*'VariableDeclaration'*/ v);
  external List<VariableDeclarator> get declarations;
  external set declarations(List<VariableDeclarator> v);
  external String /*'var'|'let'|'const'*/ get kind;
  external set kind(String /*'var'|'let'|'const'*/ v);
  external factory VariableDeclaration(
      {String /*'VariableDeclaration'*/ type,
      List<VariableDeclarator> declarations,
      String /*'var'|'let'|'const'*/ kind,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class VariableDeclarator implements BaseNode {
  external String /*'VariableDeclarator'*/ get type;
  external set type(String /*'VariableDeclarator'*/ v);
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get id;
  external set id(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get init;
  external set init(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory VariableDeclarator(
      {String /*'VariableDeclarator'*/ type,
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ id,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ init,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*type Expression = ThisExpression |
    ArrayExpression |
    ObjectExpression |
    FunctionExpression |
    ArrowFunctionExpression |
    YieldExpression |
    Literal |
    UnaryExpression |
    UpdateExpression |
    BinaryExpression |
    AssignmentExpression |
    LogicalExpression |
    MemberExpression |
    ConditionalExpression |
    CallExpression |
    NewExpression |
    SequenceExpression |
    TemplateLiteral |
    TaggedTemplateExpression |
    ClassExpression |
    MetaProperty |
    Identifier |
    AwaitExpression;*/
@anonymous
@JS()
abstract class BaseExpression implements BaseNode {
  external factory BaseExpression(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ThisExpression implements BaseExpression {
  external String /*'ThisExpression'*/ get type;
  external set type(String /*'ThisExpression'*/ v);
  external factory ThisExpression(
      {String /*'ThisExpression'*/ type,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ArrayExpression implements BaseExpression {
  external String /*'ArrayExpression'*/ get type;
  external set type(String /*'ArrayExpression'*/ v);
  external List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ >
      get elements;
  external set elements(
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > v);
  external factory ArrayExpression(
      {String /*'ArrayExpression'*/ type,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > elements,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ObjectExpression implements BaseExpression {
  external String /*'ObjectExpression'*/ get type;
  external set type(String /*'ObjectExpression'*/ v);
  external List<Property> get properties;
  external set properties(List<Property> v);
  external factory ObjectExpression(
      {String /*'ObjectExpression'*/ type,
      List<Property> properties,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class Property implements BaseNode {
  external String /*'Property'*/ get type;
  external set type(String /*'Property'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get key;
  external set key(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get value;
  external set value(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external String /*'init'|'get'|'set'*/ get kind;
  external set kind(String /*'init'|'get'|'set'*/ v);
  external bool get method;
  external set method(bool v);
  external bool get shorthand;
  external set shorthand(bool v);
  external bool get computed;
  external set computed(bool v);
  external factory Property(
      {String /*'Property'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ key,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ value,
      String /*'init'|'get'|'set'*/ kind,
      bool method,
      bool shorthand,
      bool computed,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class FunctionExpression implements BaseFunction, BaseExpression {
  external Identifier get id;
  external set id(Identifier v);
  external String /*'FunctionExpression'*/ get type;
  external set type(String /*'FunctionExpression'*/ v);
  external BlockStatement get body;
  external set body(BlockStatement v);
  external factory FunctionExpression(
      {Identifier id,
      String /*'FunctionExpression'*/ type,
      BlockStatement body,
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > params,
      bool generator,
      bool JS$async,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class SequenceExpression implements BaseExpression {
  external String /*'SequenceExpression'*/ get type;
  external set type(String /*'SequenceExpression'*/ v);
  external List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ >
      get expressions;
  external set expressions(
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ > v);
  external factory SequenceExpression(
      {String /*'SequenceExpression'*/ type,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ > expressions,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class UnaryExpression implements BaseExpression {
  external String /*'UnaryExpression'*/ get type;
  external set type(String /*'UnaryExpression'*/ v);
  external String /*'-'|'+'|'!'|'~'|'typeof'|'void'|'delete'*/ get JS$operator;
  external set JS$operator(
      String /*'-'|'+'|'!'|'~'|'typeof'|'void'|'delete'*/ v);
  external bool get prefix;
  external set prefix(bool v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory UnaryExpression(
      {String /*'UnaryExpression'*/ type,
      String /*'-'|'+'|'!'|'~'|'typeof'|'void'|'delete'*/ JS$operator,
      bool prefix,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BinaryExpression implements BaseExpression {
  external String /*'BinaryExpression'*/ get type;
  external set type(String /*'BinaryExpression'*/ v);
  external String /*'=='|'!='|'==='|'!=='|'<'|'<='|'>'|'>='|'<<'|'>>'|'>>>'|'+'|'-'|'*'|'/'|'%'|'**'|'|'|'^'|'&'|'in'|'instanceof'*/ get JS$operator;
  external set JS$operator(
      String /*'=='|'!='|'==='|'!=='|'<'|'<='|'>'|'>='|'<<'|'>>'|'>>>'|'+'|'-'|'*'|'/'|'%'|'**'|'|'|'^'|'&'|'in'|'instanceof'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get left;
  external set left(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get right;
  external set right(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory BinaryExpression(
      {String /*'BinaryExpression'*/ type,
      String /*'=='|'!='|'==='|'!=='|'<'|'<='|'>'|'>='|'<<'|'>>'|'>>>'|'+'|'-'|'*'|'/'|'%'|'**'|'|'|'^'|'&'|'in'|'instanceof'*/ JS$operator,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class AssignmentExpression implements BaseExpression {
  external String /*'AssignmentExpression'*/ get type;
  external set type(String /*'AssignmentExpression'*/ v);
  external String /*'='|'+='|'-='|'*='|'/='|'%='|'**='|'<<='|'>>='|'>>>='|'|='|'^='|'&='*/ get JS$operator;
  external set JS$operator(
      String /*'='|'+='|'-='|'*='|'/='|'%='|'**='|'<<='|'>>='|'>>>='|'|='|'^='|'&='*/ v);
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression|MemberExpression*/ get left;
  external set left(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression|MemberExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get right;
  external set right(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory AssignmentExpression(
      {String /*'AssignmentExpression'*/ type,
      String /*'='|'+='|'-='|'*='|'/='|'%='|'**='|'<<='|'>>='|'>>>='|'|='|'^='|'&='*/ JS$operator,
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression|MemberExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class UpdateExpression implements BaseExpression {
  external String /*'UpdateExpression'*/ get type;
  external set type(String /*'UpdateExpression'*/ v);
  external String /*'++'|'--'*/ get JS$operator;
  external set JS$operator(String /*'++'|'--'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external bool get prefix;
  external set prefix(bool v);
  external factory UpdateExpression(
      {String /*'UpdateExpression'*/ type,
      String /*'++'|'--'*/ JS$operator,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      bool prefix,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class LogicalExpression implements BaseExpression {
  external String /*'LogicalExpression'*/ get type;
  external set type(String /*'LogicalExpression'*/ v);
  external String /*'||'|'&&'*/ get JS$operator;
  external set JS$operator(String /*'||'|'&&'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get left;
  external set left(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get right;
  external set right(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory LogicalExpression(
      {String /*'LogicalExpression'*/ type,
      String /*'||'|'&&'*/ JS$operator,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ConditionalExpression implements BaseExpression {
  external String /*'ConditionalExpression'*/ get type;
  external set type(String /*'ConditionalExpression'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get alternate;
  external set alternate(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get consequent;
  external set consequent(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ConditionalExpression(
      {String /*'ConditionalExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ alternate,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ consequent,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class BaseCallExpression implements BaseExpression {
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ get callee;
  external set callee(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ v);
  external List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ >
      get arguments;
  external set arguments(
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > v);
  external factory BaseCallExpression(
      {dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ callee,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > arguments,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type CallExpression = SimpleCallExpression | NewExpression;*/
@anonymous
@JS()
abstract class SimpleCallExpression implements BaseCallExpression {
  external String /*'CallExpression'*/ get type;
  external set type(String /*'CallExpression'*/ v);
  external factory SimpleCallExpression(
      {String /*'CallExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ callee,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > arguments,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class NewExpression implements BaseCallExpression {
  external String /*'NewExpression'*/ get type;
  external set type(String /*'NewExpression'*/ v);
  external factory NewExpression(
      {String /*'NewExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ callee,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|SpreadElement*/ > arguments,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class MemberExpression implements BaseExpression, BasePattern {
  external String /*'MemberExpression'*/ get type;
  external set type(String /*'MemberExpression'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ get object;
  external set object(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get property;
  external set property(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external bool get computed;
  external set computed(bool v);
  external factory MemberExpression(
      {String /*'MemberExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression|Super*/ object,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ property,
      bool computed,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Pattern =
    Identifier | ObjectPattern | ArrayPattern | RestElement |
    AssignmentPattern | MemberExpression;*/
@anonymous
@JS()
abstract class BasePattern implements BaseNode {
  external factory BasePattern(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class SwitchCase implements BaseNode {
  external String /*'SwitchCase'*/ get type;
  external set type(String /*'SwitchCase'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get test;
  external set test(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ >
      get consequent;
  external set consequent(
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ > v);
  external factory SwitchCase(
      {String /*'SwitchCase'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ test,
      List<
          dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ > consequent,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class CatchClause implements BaseNode {
  external String /*'CatchClause'*/ get type;
  external set type(String /*'CatchClause'*/ v);
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get param;
  external set param(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external BlockStatement get body;
  external set body(BlockStatement v);
  external factory CatchClause(
      {String /*'CatchClause'*/ type,
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ param,
      BlockStatement body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class Identifier implements BaseNode, BaseExpression, BasePattern {
  external String /*'Identifier'*/ get type;
  external set type(String /*'Identifier'*/ v);
  external String get name;
  external set name(String v);
  external factory Identifier(
      {String /*'Identifier'*/ type,
      String name,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Literal = SimpleLiteral | RegExpLiteral;*/
@anonymous
@JS()
abstract class SimpleLiteral implements BaseNode, BaseExpression {
  external String /*'Literal'*/ get type;
  external set type(String /*'Literal'*/ v);
  external dynamic /*String|bool|num|Null*/ get value;
  external set value(dynamic /*String|bool|num|Null*/ v);
  external String get raw;
  external set raw(String v);
  external factory SimpleLiteral(
      {String /*'Literal'*/ type,
      dynamic /*String|bool|num|Null*/ value,
      String raw,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class RegExpLiteral implements BaseNode, BaseExpression {
  external String /*'Literal'*/ get type;
  external set type(String /*'Literal'*/ v);
  external RegExp get value;
  external set value(RegExp v);
  external dynamic /*{
    pattern: string;
    flags: string;
  }*/
      get regex;
  external set regex(
      dynamic /*{
    pattern: string;
    flags: string;
  }*/
      v);
  external String get raw;
  external set raw(String v);
  external factory RegExpLiteral(
      {String /*'Literal'*/ type,
      RegExp value,
      dynamic /*{
    pattern: string;
    flags: string;
  }*/
      regex,
      String raw,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type UnaryOperator =
    "-" | "+" | "!" | "~" | "typeof" | "void" | "delete";*/
/*export type BinaryOperator =
    "==" | "!=" | "===" | "!==" | "<" | "<=" | ">" | ">=" | "<<" |
    ">>" | ">>>" | "+" | "-" | "*" | "/" | "%" | "**" | "|" | "^" | "&" | "in" |
    "instanceof";*/
/*export type LogicalOperator = "||" | "&&";*/
/*export type AssignmentOperator =
    "=" | "+=" | "-=" | "*=" | "/=" | "%=" | "**=" | "<<=" | ">>=" | ">>>=" |
    "|=" | "^=" | "&=";*/
/*export type UpdateOperator = "++" | "--";*/
@anonymous
@JS()
abstract class ForOfStatement implements BaseForXStatement {
  external String /*'ForOfStatement'*/ get type;
  external set type(String /*'ForOfStatement'*/ v);
  external factory ForOfStatement(
      {String /*'ForOfStatement'*/ type,
      dynamic /*VariableDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      dynamic /*ExpressionStatement|BlockStatement|EmptyStatement|DebuggerStatement|WithStatement|ReturnStatement|LabeledStatement|BreakStatement|ContinueStatement|IfStatement|SwitchStatement|ThrowStatement|TryStatement|WhileStatement|DoWhileStatement|ForStatement|ForInStatement|ForOfStatement|FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class Super implements BaseNode {
  external String /*'Super'*/ get type;
  external set type(String /*'Super'*/ v);
  external factory Super(
      {String /*'Super'*/ type,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class SpreadElement implements BaseNode {
  external String /*'SpreadElement'*/ get type;
  external set type(String /*'SpreadElement'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory SpreadElement(
      {String /*'SpreadElement'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ArrowFunctionExpression implements BaseExpression, BaseFunction {
  external String /*'ArrowFunctionExpression'*/ get type;
  external set type(String /*'ArrowFunctionExpression'*/ v);
  external bool get expression;
  external set expression(bool v);
  external dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get body;
  external set body(
      dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ArrowFunctionExpression(
      {String /*'ArrowFunctionExpression'*/ type,
      bool expression,
      dynamic /*BlockStatement|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range,
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > params,
      bool generator,
      bool JS$async});
}

@anonymous
@JS()
abstract class YieldExpression implements BaseExpression {
  external String /*'YieldExpression'*/ get type;
  external set type(String /*'YieldExpression'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external bool get delegate;
  external set delegate(bool v);
  external factory YieldExpression(
      {String /*'YieldExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      bool delegate,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class TemplateLiteral implements BaseExpression {
  external String /*'TemplateLiteral'*/ get type;
  external set type(String /*'TemplateLiteral'*/ v);
  external List<TemplateElement> get quasis;
  external set quasis(List<TemplateElement> v);
  external List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ >
      get expressions;
  external set expressions(
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ > v);
  external factory TemplateLiteral(
      {String /*'TemplateLiteral'*/ type,
      List<TemplateElement> quasis,
      List<
          dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ > expressions,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class TaggedTemplateExpression implements BaseExpression {
  external String /*'TaggedTemplateExpression'*/ get type;
  external set type(String /*'TaggedTemplateExpression'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get tag;
  external set tag(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external TemplateLiteral get quasi;
  external set quasi(TemplateLiteral v);
  external factory TaggedTemplateExpression(
      {String /*'TaggedTemplateExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ tag,
      TemplateLiteral quasi,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class TemplateElement implements BaseNode {
  external String /*'TemplateElement'*/ get type;
  external set type(String /*'TemplateElement'*/ v);
  external bool get tail;
  external set tail(bool v);
  external dynamic /*{
    cooked: string;
    raw: string;
  }*/
      get value;
  external set value(
      dynamic /*{
    cooked: string;
    raw: string;
  }*/
      v);
  external factory TemplateElement(
      {String /*'TemplateElement'*/ type,
      bool tail,
      dynamic /*{
    cooked: string;
    raw: string;
  }*/
      value,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class AssignmentProperty implements Property {
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get value;
  external set value(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external String /*'init'*/ get kind;
  external set kind(String /*'init'*/ v);
  external bool get method;
  external set method(bool v);
  external factory AssignmentProperty(
      {dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ value,
      String /*'init'*/ kind,
      bool method,
      String /*'Property'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ key,
      bool shorthand,
      bool computed,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ObjectPattern implements BasePattern {
  external String /*'ObjectPattern'*/ get type;
  external set type(String /*'ObjectPattern'*/ v);
  external List<AssignmentProperty> get properties;
  external set properties(List<AssignmentProperty> v);
  external factory ObjectPattern(
      {String /*'ObjectPattern'*/ type,
      List<AssignmentProperty> properties,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ArrayPattern implements BasePattern {
  external String /*'ArrayPattern'*/ get type;
  external set type(String /*'ArrayPattern'*/ v);
  external List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ >
      get elements;
  external set elements(
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > v);
  external factory ArrayPattern(
      {String /*'ArrayPattern'*/ type,
      List<
          dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ > elements,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class RestElement implements BasePattern {
  external String /*'RestElement'*/ get type;
  external set type(String /*'RestElement'*/ v);
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get argument;
  external set argument(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external factory RestElement(
      {String /*'RestElement'*/ type,
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class AssignmentPattern implements BasePattern {
  external String /*'AssignmentPattern'*/ get type;
  external set type(String /*'AssignmentPattern'*/ v);
  external dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ get left;
  external set left(
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get right;
  external set right(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory AssignmentPattern(
      {String /*'AssignmentPattern'*/ type,
      dynamic /*Identifier|ObjectPattern|ArrayPattern|RestElement|AssignmentPattern|MemberExpression*/ left,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ right,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type Class = ClassDeclaration | ClassExpression;*/
@anonymous
@JS()
abstract class BaseClass implements BaseNode {
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get superClass;
  external set superClass(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external ClassBody get body;
  external set body(ClassBody v);
  external factory BaseClass(
      {dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ superClass,
      ClassBody body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ClassBody implements BaseNode {
  external String /*'ClassBody'*/ get type;
  external set type(String /*'ClassBody'*/ v);
  external List<MethodDefinition> get body;
  external set body(List<MethodDefinition> v);
  external factory ClassBody(
      {String /*'ClassBody'*/ type,
      List<MethodDefinition> body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class MethodDefinition implements BaseNode {
  external String /*'MethodDefinition'*/ get type;
  external set type(String /*'MethodDefinition'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get key;
  external set key(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external FunctionExpression get value;
  external set value(FunctionExpression v);
  external String /*'constructor'|'method'|'get'|'set'*/ get kind;
  external set kind(String /*'constructor'|'method'|'get'|'set'*/ v);
  external bool get computed;
  external set computed(bool v);
  external bool get JS$static;
  external set JS$static(bool v);
  external factory MethodDefinition(
      {String /*'MethodDefinition'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ key,
      FunctionExpression value,
      String /*'constructor'|'method'|'get'|'set'*/ kind,
      bool computed,
      bool JS$static,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ClassDeclaration implements BaseClass, BaseDeclaration {
  external String /*'ClassDeclaration'*/ get type;
  external set type(String /*'ClassDeclaration'*/ v);
  external Identifier get id;
  external set id(Identifier v);
  external factory ClassDeclaration(
      {String /*'ClassDeclaration'*/ type,
      Identifier id,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ superClass,
      ClassBody body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ClassExpression implements BaseClass, BaseExpression {
  external String /*'ClassExpression'*/ get type;
  external set type(String /*'ClassExpression'*/ v);
  external Identifier get id;
  external set id(Identifier v);
  external factory ClassExpression(
      {String /*'ClassExpression'*/ type,
      Identifier id,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ superClass,
      ClassBody body,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class MetaProperty implements BaseExpression {
  external String /*'MetaProperty'*/ get type;
  external set type(String /*'MetaProperty'*/ v);
  external Identifier get meta;
  external set meta(Identifier v);
  external Identifier get property;
  external set property(Identifier v);
  external factory MetaProperty(
      {String /*'MetaProperty'*/ type,
      Identifier meta,
      Identifier property,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type ModuleDeclaration =
    ImportDeclaration | ExportNamedDeclaration | ExportDefaultDeclaration |
    ExportAllDeclaration;*/
@anonymous
@JS()
abstract class BaseModuleDeclaration implements BaseNode {
  external factory BaseModuleDeclaration(
      {List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

/*export type ModuleSpecifier =
    ImportSpecifier | ImportDefaultSpecifier | ImportNamespaceSpecifier |
    ExportSpecifier;*/
@anonymous
@JS()
abstract class BaseModuleSpecifier implements BaseNode {
  external Identifier get local;
  external set local(Identifier v);
  external factory BaseModuleSpecifier(
      {Identifier local,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ImportDeclaration implements BaseModuleDeclaration {
  external String /*'ImportDeclaration'*/ get type;
  external set type(String /*'ImportDeclaration'*/ v);
  external List<
          dynamic /*ImportSpecifier|ImportDefaultSpecifier|ImportNamespaceSpecifier*/ >
      get specifiers;
  external set specifiers(
      List<
          dynamic /*ImportSpecifier|ImportDefaultSpecifier|ImportNamespaceSpecifier*/ > v);
  external dynamic /*SimpleLiteral|RegExpLiteral*/ get source;
  external set source(dynamic /*SimpleLiteral|RegExpLiteral*/ v);
  external factory ImportDeclaration(
      {String /*'ImportDeclaration'*/ type,
      List<
          dynamic /*ImportSpecifier|ImportDefaultSpecifier|ImportNamespaceSpecifier*/ > specifiers,
      dynamic /*SimpleLiteral|RegExpLiteral*/ source,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ImportSpecifier implements BaseModuleSpecifier {
  external String /*'ImportSpecifier'*/ get type;
  external set type(String /*'ImportSpecifier'*/ v);
  external Identifier get imported;
  external set imported(Identifier v);
  external factory ImportSpecifier(
      {String /*'ImportSpecifier'*/ type,
      Identifier imported,
      Identifier local,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ImportDefaultSpecifier implements BaseModuleSpecifier {
  external String /*'ImportDefaultSpecifier'*/ get type;
  external set type(String /*'ImportDefaultSpecifier'*/ v);
  external factory ImportDefaultSpecifier(
      {String /*'ImportDefaultSpecifier'*/ type,
      Identifier local,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ImportNamespaceSpecifier implements BaseModuleSpecifier {
  external String /*'ImportNamespaceSpecifier'*/ get type;
  external set type(String /*'ImportNamespaceSpecifier'*/ v);
  external factory ImportNamespaceSpecifier(
      {String /*'ImportNamespaceSpecifier'*/ type,
      Identifier local,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ExportNamedDeclaration implements BaseModuleDeclaration {
  external String /*'ExportNamedDeclaration'*/ get type;
  external set type(String /*'ExportNamedDeclaration'*/ v);
  external dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ get declaration;
  external set declaration(
      dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ v);
  external List<ExportSpecifier> get specifiers;
  external set specifiers(List<ExportSpecifier> v);
  external dynamic /*SimpleLiteral|RegExpLiteral*/ get source;
  external set source(dynamic /*SimpleLiteral|RegExpLiteral*/ v);
  external factory ExportNamedDeclaration(
      {String /*'ExportNamedDeclaration'*/ type,
      dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration*/ declaration,
      List<ExportSpecifier> specifiers,
      dynamic /*SimpleLiteral|RegExpLiteral*/ source,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ExportSpecifier implements BaseModuleSpecifier {
  external String /*'ExportSpecifier'*/ get type;
  external set type(String /*'ExportSpecifier'*/ v);
  external Identifier get exported;
  external set exported(Identifier v);
  external factory ExportSpecifier(
      {String /*'ExportSpecifier'*/ type,
      Identifier exported,
      Identifier local,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ExportDefaultDeclaration implements BaseModuleDeclaration {
  external String /*'ExportDefaultDeclaration'*/ get type;
  external set type(String /*'ExportDefaultDeclaration'*/ v);
  external dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get declaration;
  external set declaration(
      dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory ExportDefaultDeclaration(
      {String /*'ExportDefaultDeclaration'*/ type,
      dynamic /*FunctionDeclaration|VariableDeclaration|ClassDeclaration|ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ declaration,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class ExportAllDeclaration implements BaseModuleDeclaration {
  external String /*'ExportAllDeclaration'*/ get type;
  external set type(String /*'ExportAllDeclaration'*/ v);
  external dynamic /*SimpleLiteral|RegExpLiteral*/ get source;
  external set source(dynamic /*SimpleLiteral|RegExpLiteral*/ v);
  external factory ExportAllDeclaration(
      {String /*'ExportAllDeclaration'*/ type,
      dynamic /*SimpleLiteral|RegExpLiteral*/ source,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

@anonymous
@JS()
abstract class AwaitExpression implements BaseExpression {
  external String /*'AwaitExpression'*/ get type;
  external set type(String /*'AwaitExpression'*/ v);
  external dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ get argument;
  external set argument(
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ v);
  external factory AwaitExpression(
      {String /*'AwaitExpression'*/ type,
      dynamic /*ThisExpression|ArrayExpression|ObjectExpression|FunctionExpression|ArrowFunctionExpression|YieldExpression|SimpleLiteral|RegExpLiteral|UnaryExpression|UpdateExpression|BinaryExpression|AssignmentExpression|LogicalExpression|MemberExpression|ConditionalExpression|SimpleCallExpression|NewExpression|NewExpression|SequenceExpression|TemplateLiteral|TaggedTemplateExpression|ClassExpression|MetaProperty|Identifier|AwaitExpression*/ argument,
      List<Comment> leadingComments,
      List<Comment> trailingComments,
      SourceLocation loc,
      List<num> /*Tuple of <num,num>*/ range});
}

