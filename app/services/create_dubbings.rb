class CreateDubbings
  PRODUCER_ID = 1
  def initialize(registers)
    @registers = registers
  end

  def call
    @registers.each{|r| create_dubbing(r)}
  end

  def create_dubbing(register)
    register = OpenStruct.new(register)
    voice_actor = get_voice_actor(register)
    studio = get_studio(register.studio)
    byebug
    dubbing = Dubbing.create(studio_id: studio.id,
                producer_id: PRODUCER_ID,
                voice_actor_id: voice_actor.id,
                date: register.date,
                time: register.time)
    dubbing
  end

  def get_voice_actor(register)
    voice_actor = User.find_by_email(register.email)
    unless voice_actor
      voice_actor = new_voice_actor(register)
    end
    voice_actor
  end

  def new_voice_actor(register)
    User.create(name: register.voice_actor,
             phonenumber: register.phone,
             email: register.email,
             role: Role.voice_actor)
  end

  def get_studio(studio_name)
    studio = Studio.find_by_name(studio_name.upcase)
    unless studio
      studio = Studio.create(name: studio_name)
    end
    studio
  end
end