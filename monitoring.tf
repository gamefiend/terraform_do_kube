#datadog monitoring
resource "datadog_timeboard" "sample" {
    title   = "Sample Timeboard"
    description = "Sample timeboard created by Terraform"
    read_only = true

    graph {
        title = "System Load (1min)"
        viz = "timeseries"
        
        request {
            q = "avg:system.load.1{$host}",
            type = "line"
            style {
                palette = "warm"
            }
        }
    }        

    template_variable {
        name = "host"
        prefix = "host"
    }
}
