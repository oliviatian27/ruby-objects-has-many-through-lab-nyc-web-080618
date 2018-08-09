class Patient
  attr_accessor :name,:appointments
  def initialize(name)
    @name =name
    @appointments=[]
  end

  def new_appointment(doctor,date)
    appointment=Appointment.new(self,doctor,date)
    @appointments << appointment
    appointment
  end

  def doctors
    app=Appointment.all.select {
      |appointment|
      appointment.patient==self
    }
    app.map{|app|
    app.doctor}
  end

end
