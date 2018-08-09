class Doctor
 @@all =[]
 attr_accessor :name
  def initialize(name)
    @name=name
    @@all<<self
    @appointments=[]
  end

  def new_appointment(patient,date)
    appointment=Appointment.new(patient,self,date)
    @appointments << appointment
    appointment
  end

  def appointments
    @appointments
  end

  def patients
    appointment=Appointment.all.select {
      |appointment|
      appointment.doctor==self
    }
    appointment.map{|app|
    app.patient}
  end

  def self.all
    @@all
  end
end
