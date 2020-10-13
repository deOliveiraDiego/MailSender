class Dubbing < ApplicationRecord
  validate :uniqueness_of_dubbing
  belongs_to :producer, class_name: "User"
  belongs_to :voice_actor, class_name: "User"
  belongs_to :studio

  def uniqueness_of_dubbing
    dubbings = Dubbing.where(studio_id: self.studio_id,
                             date: self.date,
                             time: self.time)
    if dubbings.any?
      errors.add(:studio, "já possui um agendamento nesse mesmo dia e horário.")
    end
  end
end
