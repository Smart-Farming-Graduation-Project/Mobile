import 'package:flutter_bloc/flutter_bloc.dart';
import 'vote_state.dart';

class VoteCubit extends Cubit<VoteState> {
  VoteCubit(int initialVotes)
      : super(VoteState(votes: initialVotes, voteStatus: VoteStatus.neutral));

  void upvote() {
    if (state.voteStatus == VoteStatus.upvoted) {
      emit(state.copyWith(votes: state.votes - 1, voteStatus: VoteStatus.neutral));
    } else {
      int newVotes = state.votes + (state.voteStatus == VoteStatus.downvoted ? 1 : 1);
      emit(state.copyWith(votes: newVotes, voteStatus: VoteStatus.upvoted));
    }
  }

  void downvote() {
    if (state.voteStatus == VoteStatus.downvoted) {
      emit(state.copyWith(votes: state.votes + 1, voteStatus: VoteStatus.neutral));
    } else {
      int newVotes = state.votes - (state.voteStatus == VoteStatus.upvoted ? 1 : 1);
      emit(state.copyWith(votes: newVotes, voteStatus: VoteStatus.downvoted));
    }
  }
}
