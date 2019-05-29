import PredictMDAPI

const AbstractEstimator = PredictMDAPI.AbstractEstimator

abstract type MyEstimator <: AbstractEstimator end

struct MyClassificationModel <: MyEstimator
    name::String
end

struct MyRegressionModel <: MyEstimator
    name::String
end


const ModelStyle = PredictMDAPI.ModelStyle
const Classification = PredictMDAPI.Classification
const Regression = PredictMDAPI.Regression

ModelStyle(::MyClassificationModel) = Classification
ModelStyle(::MyRegressionModel) = Regression

myfunction(x::MyEstimator)::String = _myfunction(ModelStyle(x), x)

function _myfunction(::Type{Classification}, x::MyEstimator)::String
    result::String = "$(x.name) is a classification model."
    return result
end

function _myfunction(::Type{Regression}, x::MyEstimator)::String
    result::String = "$(x.name) is a regression model."
    return result
end

my_classification_model = MyClassificationModel("My Classification Model")
my_regression_model = MyRegressionModel("My Regression Model")

Test.@test(
    Test.@inferred(myfunction(my_classification_model)) ==
        "My Classification Model is a classification model."
    )

Test.@test(
    Test.@inferred(myfunction(my_regression_model)) ==
        "My Regression Model is a regression model."
    )

Test.@test(
    isa(
        Test.@inferred(ModelStyle(my_classification_model)),
        Type{Classification},
        )
    )

Test.@test(
    isa(
        Test.@inferred(ModelStyle(my_regression_model)),
        Type{Regression},
        )
    )
