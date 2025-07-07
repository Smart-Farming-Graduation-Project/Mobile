import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crop_guard/core/api/dio_consumer.dart';
import 'package:crop_guard/core/errors/exceptions.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/core/api/end_points.dart';
import 'vote_state.dart';

class VoteCubit extends Cubit<VoteState> {
  final DioConsumer api;
  final int postId;

  VoteCubit({
    required int initialVotes,
    required this.postId,
  })  : api = getIt<DioConsumer>(),
        super(VoteState(votes: initialVotes, voteStatus: VoteStatus.neutral));

  Future<void> upvote() async {
    try {
      if (state.voteStatus == VoteStatus.upvoted) {
        await _deleteVote();
        emit(state.copyWith(
          votes: state.votes - 1,
          voteStatus: VoteStatus.neutral,
        ));
      } else {
        await _sendVote(1);
        int newVotes = state.votes + (state.voteStatus == VoteStatus.downvoted ? 2 : 1);
        emit(state.copyWith(
          votes: newVotes,
          voteStatus: VoteStatus.upvoted,
        ));
      }
    } catch (e) {
      // handle error here if needed
    }
  }

  Future<void> downvote() async {
    try {
      if (state.voteStatus == VoteStatus.downvoted) {
        await _deleteVote();
        emit(state.copyWith(
          votes: state.votes + 1,
          voteStatus: VoteStatus.neutral,
        ));
      } else {
        await _sendVote(-1);
        int newVotes = state.votes - (state.voteStatus == VoteStatus.upvoted ? 2 : 1);
        emit(state.copyWith(
          votes: newVotes,
          voteStatus: VoteStatus.downvoted,
        ));
      }
    } catch (e) {
      // handle error here if needed
    }
  }

  Future<void> _sendVote(int voteType) async {
    try {
      await api.post(
        EndPoints.vote,
        data: {
          "targetId": postId,
          "targetType": "post",
          "voteType": voteType,
        },
      );
    } on ServerException catch (e) {
      throw Exception("Vote failed: ${e.errorModel.errorMessage}");
    }
  }

  Future<void> _deleteVote() async {
    try {
      await api.delete(
        EndPoints.deleteVote,
        data: {
          "targetId": postId,
          "targetType": "post",
        },
      );
    } on ServerException catch (e) {
      throw Exception("Delete vote failed: ${e.errorModel.errorMessage}");
    }
  }
}
