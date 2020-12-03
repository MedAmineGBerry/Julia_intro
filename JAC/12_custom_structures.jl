mutable struct MyOwnType
    property1
    property2::String
  end

mutable struct MyOwnType{T<:Number}
    property1
    property2::String
    property3::T
end

#one can ommit mutable when you want it immutable

abstract type MyOwnGenericAbstractType end
abstract type MyOwnAbstractType <: MyOwnGenericAbstractType end
mutable struct AConcreteType <: MyOwnAbstractType
  property1
  property2::String
end

#init 
myObject = MyOwnType("something","something",10)
a = myObject.property3 # 10


#OO PARADIGM JULIA
struct Person
    myname::String
    age::Int64
  end
  
  struct Shoes
     shoesType::String
     colour::String
  end
  
  struct Student
     s::Person
     school::String
     shoes::Shoes
  end
  
  function printMyActivity(self::Student)
     println("I study at $(self.school) school")
  end
  
  struct Employee
     s::Person
     monthlyIncomes::Float64
     company::String
     shoes::Shoes
  end
  
  function printMyActivity(self::Employee)
    println("I work at $(self.company) company")
  end
  
  gymShoes = Shoes("gym","white")
  proShoes = Shoes("classical","brown")
  
  Marc = Student(Person("Marc",15),"Divine School",gymShoes)
  MrBrown = Employee(Person("Brown",45),1200.0,"ABC Corporation Inc.", proShoes)
  
  printMyActivity(Marc)
  printMyActivity(MrBrown)

#= you do not associate functions to a type. 
So, you do not call a function over a method (myobj.func(x,y))
 but rather you pass the object as a parameter (func(myobj, x, y)); =#

# Multiple-inheritance is not supported (yet).

#= supertype(MyType)Returns the parent types of a type
subtypes(MyType) Lists all children of a type
fieldnames(MyType) Queries all the fields of a structure
isa(obj,MyType) Checks if obj is of type MyType
typeof(obj) Returns the type of obj =#