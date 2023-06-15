module ApplicationHelper

  def carbon_badge(carbon_savings)
    if carbon_savings == 0
      { icon: 'seedling',
        tree: "https://assets4.lottiefiles.com/packages/lf20_o32VvNhBlv.json",
        level: "Blue Badge Owner, start your journey with a single step and unclock the Bronze Badge!'" }
    elsif carbon_savings < 100
      { icon: 'award',
        tree: "https://assets4.lottiefiles.com/packages/lf20_e3ux72wx.json",
        level: "You are on the Level 2. Reach over 100 points and unlock the Silver Badge!'"}
    elsif carbon_savings > 100 && carbon_savings < 500
      { icon: 'medal',
        tree: "https://assets4.lottiefiles.com/private_files/lf30_I6qCjk.json",
        level: "You are on the Level 3. Reach over 500 points and unlock the Golden Badge.'"}
    else
      { icon: 'trophy',
        tree: "https://assets8.lottiefiles.com/private_files/lf30_jdygihq2.json",
        level: "You are on the Level 4! Golden Badge unlocked!.'" }
    end
  end
end
