module AnswersHelper
  def answer_fact
    tag.div id: "fact", class: "w-full block text-center py-3 px-4 rounded-2xl block w-full text-[#061718] bg-blue-50 shadow-lg transition-all duration-150" do
      "Fakt"
    end
  end

  def answer_myth
    tag.div id: "myth", class: "w-full block text-center py-3 px-4 rounded-2xl block w-full text-[#061718] bg-blue-50 shadow-lg transition-all duration-150" do
      "Mýtus"
    end
  end
end
