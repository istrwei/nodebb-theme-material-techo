<div class="topic">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	<div class="row">
		<div class="col-md-9" no-widget-class="col-lg-12 col-xs-12" no-widget-target="topic-sidebar">
			<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted -->">[[topic:deleted_message]]</div>
			<div class="card">
				<div class="listview lv-lg">

					<div class="lv-body" component="topic" data-tid="{tid}">
						<!-- IMPORT partials/topic/main-post.tpl -->

							<!-- BEGIN posts -->
							<!-- IF !@first -->
								<!-- IMPORT partials/topic/post.tpl -->
							<!-- ENDIF !@first -->
							<!-- END posts -->


							  <div class="post-bar">
							    <!-- IMPORT partials/post_bar.tpl -->
							  </div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-xs-12">
			<div widget-area="topic-sidebar">
				<!-- BEGIN widgets -->
				{widgets.html}
				<!-- END widgets -->
			</div>
		</div>
	</div>
	<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
	<!-- ENDIF config.usePagination -->

</div>
<!-- IMPORT partials/noscript/paginator.tpl -->
