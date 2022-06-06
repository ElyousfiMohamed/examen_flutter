abstract class LivreEvent {}

// get all livres event
class GetAllLivresEvent extends LivreEvent {}

// getAll livres by keyword event
class GetLivresByKeywordEvent extends LivreEvent {
  final String keyword;

  GetLivresByKeywordEvent(this.keyword);
}

// delete livre event
class DeleteLivreEvent extends LivreEvent {
  final int id;

  DeleteLivreEvent(this.id);
}