# Plots the AUC values of an ML model using ggplot2 ----
# Prerequisites: the column that contains the size of the subsets is called "subset.size"
# Arguments:
# `AUC.values`: a data.frame returned from compute_aucs()
# `model.name`: a string contains the name of the model that was used to obtain `AUC.values`
auc_plot <- function(AUC.values, model.name) {
  melted.AUC.values <- reshape2::melt(AUC.values, id = "subset.size")
  plot <- ggplot2::ggplot(melted.AUC.values, ggplot2::aes(x = subset.size, y = value, color = variable)) +
    ggplot2::xlab("Number of Features Used") +
    ggplot2::ylab("AUC") +
    ggplot2::ggtitle(model.name) +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5, face = "bold")) +
    # ggplot2::scale_x_continuous(trans = reverselog_trans()) +
    ggplot2::scale_x_reverse(labels = function(x) glue::glue("{x}\n({round(x / max(AUC.values$subset.size) * 100, 1)}%)")) +
    ggplot2::geom_line(linetype = "dotdash", linewidth = 1) +
    ggplot2::labs(linetype = "FS Method", color = "FS Method")

  plot <- plot + ggplot2::scale_y_continuous(
    breaks = seq(min(plot$data$value), max(plot$data$value), length.out = 5),
    labels = scales::label_number(accuracy = 0.01)
  )

  return(plot)
}
