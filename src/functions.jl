# models:
function fit! end
function get_history end
function get_underlying end
function parse_functions! end
function predict end
function predict_proba end
function set_feature_contrasts! end
function set_max_epochs! end
function simple_linear_regression end
function transform end

# metrics:
function accuracy end
function auprc end
function aurocc end
function binary_brier_score end
function cohen_kappa end
function f1score end
function false_negative_rate end
function false_positive_rate end
function fbetascore end
function mean_squared_error end
function negative_predictive_value end
function positive_predictive_value end
function prcurve end
function precision end
function r2score end
function recall end
function roccurve end
function root_mean_squared_error end
function sensitivity end
function specificity end
function true_negative_rate end
function true_positive_rate end

# plotting:
function plotlearningcurve end
function plotprcurve end
function plotroccurve end

# saving and loading:
function load_model end
function open_plot end
function save_model end
function save_plot end
