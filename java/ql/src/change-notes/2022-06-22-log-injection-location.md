---
category: minorAnalysis
---
* The query `java/log-injection` now reports problems at the source (user-controlled data) instead of at the ultimate logging call. This was changed because user functions that wrap the ultimate logging call could result in most alerts being reported in an uninformative location.
