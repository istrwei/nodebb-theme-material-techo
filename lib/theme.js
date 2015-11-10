(function(module) {
	"use strict";

	var	meta = module.parent.require('./meta'),
	fs = require('fs'),
	path = require('path'),
	topics = module.parent.require('./topics'),
	translator = module.parent.require('../public/src/modules/translator'),
	async = module.parent.require('async'),
	app,
	middleware;

	var theme =
	{
		templates: {}
	};


	theme.init = function(params, callback) {
		app = params.router;
		middleware = params.middleware;

		app.get('/admin/plugins/material', middleware.admin.buildHeader, renderAdmin);
		app.get('/api/admin/plugins/material', renderAdmin);

		var templatesToLoad = [
			"admin/materialrecent.tpl"
		];

		function loadTemplate(template, next) {
			fs.readFile(path.resolve(__dirname, '../templates/' + template), function (err, data) {
				if (err) {
					console.log(err.message);
					return next(err);
				}
				theme.templates[template] = data.toString();
				next(null);
			});
		}

		async.each(templatesToLoad, loadTemplate);

		callback();
	};

	theme.renderMaterialRecent = function(widget, callback) {
		var stop = (parseInt(meta.config.topicsPerList, 10) || 20) - 1;

		topics.getTopicsFromSet('topics:recent', widget.uid, 0, stop, function(err, data) {
			if (err) {
				return next(err);
			}

			var pinned_tids = widget.data.pinned_tid.split(/\s+/);
			var i_pinned_tids = new Array();
			for (var i = 0; i < pinned_tids.length; i++) {
				var parsedInt = parseInt(pinned_tids[i], 10) || -1;
				if (parsedInt != -1)
					i_pinned_tids.push(pinned_tids[i]);
			}


			var t = topics.getTopics(i_pinned_tids, widget.uid, function(err, new_data){
				if (err){
					return next(err);
				}

				for(var key in data.topics) {
					if (i_pinned_tids.indexOf(data.topics[key].tid) == -1) {
						new_data.push(data.topics[key]);
					}
				}

				data.topics = new_data;

				data.loggedIn = (parseInt(widget.uid, 10) !== 0);

				app.render('widgets/materialrecent', data, function(err, html) {
					translator.translate(html, function(translatedHTML) {
						callback(err, translatedHTML);
					});
				});

			});

		});
	};

	theme.defineWidgets = function(widgets, callback) {
		widgets = widgets.concat([
			{
				widget: "materialrecent",
				name: "Recent Topics with Material Theme",
				description: "Lists the latest topics on your forum.",
				content: theme.templates['admin/materialrecent.tpl']
			}
		]);

		callback(null, widgets);
	};

	theme.defineWidgetAreas = function(areas, callback) {
		areas = areas.concat([
			{
				'name': 'Topic Sidebar',
				'template': 'topic.tpl',
				'location': 'topic-sidebar'
			}
		]);

		callback(null, areas);
	};

	theme.addAdminNavigation = function(header, callback) {
		header.plugins.push({
			route: '/plugins/material',
			icon: 'fa-paint-brush',
			name: 'Material Design Theme'
		});

		callback(null, header);
	};

	theme.getConfig = function(config, callback) {
		config.menuInHeader = !!parseInt(meta.config.menuInHeader, 10);
		config.removeCategoriesAnimation = !!parseInt(meta.config.removeCategoriesAnimation, 10);
		config.subCategoriesAsCards = !!parseInt(meta.config.subCategoriesAsCards, 10);
		callback(false, config);
	};

	function renderAdmin(req, res, next) {
		res.render('admin/plugins/material', {});
	}

	module.exports = theme;

}(module));
