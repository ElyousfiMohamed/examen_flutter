abstract class AdherentEvent {}

// getAll adherents event
class GetAllAdherentsEvent extends AdherentEvent {}

// delete adherent event
class DeleteAdherentEvent extends AdherentEvent {
  final int id;

  DeleteAdherentEvent(this.id);
}