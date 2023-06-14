module ApplicationHelper

  def carbon_badge(carbon_savings)
    if carbon_savings == 0
      { icon: 'seedling',
        tree: "https://assets4.lottiefiles.com/packages/lf20_o32VvNhBlv.json" }
    elsif carbon_savings < 100
      { icon: 'award',
        tree: "https://assets4.lottiefiles.com/packages/lf20_e3ux72wx.json" }
    elsif carbon_savings > 100 && carbon_savings < 500
      { icon: 'medal',
        tree: "https://assets4.lottiefiles.com/private_files/lf30_I6qCjk.json" }
    else
      { icon: 'trophy',
        tree: "https://assets8.lottiefiles.com/private_files/lf30_jdygihq2.json" }
    end
  end
end
