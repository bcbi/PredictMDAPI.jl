abstract type TargetStyle end
struct UnknownTargetStyle <: TargetStyle end
struct MixedTargetStyle <: TargetStyle end
struct Classification <: TargetStyle end
struct Regression <: TargetStyle end
