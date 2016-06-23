/*global fis*/
/*
 * fis.config.set('settings.smarty', {
 *     left_delimiter: '{',
 *     right_delimiter: '}'
 * }); 
 */
fis.config.merge({
    namespace: 'manage',
    /*pack: {
        'static/pkg/aio.css': [
            'static/base/base.css',
            /^\/widget\/(.*\.css)$/i
        ],
        'static/pkg/aio.js': [
            'static/modjs/mod.js',
            /^\/widget\/(.*\.js)$/i
        ]
    },*/
    deploy: {
        hug: [
            {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/home/work/mr-hug.com/backend/web/static',
                /*to: '/home/work/mr-hug.com/backend/assets/',*/
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/config',
                to: '/home/work/mr-hug.com/backend/runtime/Smarty/config',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/template',
                to: '/home/work/mr-hug.com/backend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        tour: [
            {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/home/work/tour/backend/web/static',
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/config',
                to: '/home/work/tour/backend/runtime/Smarty/config',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13/fisupload.php',
                from: '/template',
                to: '/home/work/tour/backend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        test: [
            {
                receiver: 'http://182.92.65.13:8887/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/home/work/odp/webroot/tour/backend/web/static',
                /*to: '/home/work/odp/webroot/tour/backend/assets/',*/
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13:8887/fisupload.php',
                from: '/config',
                to: '/home/work/odp/webroot/tour/backend/runtime/Smarty/config',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://182.92.65.13:8887/fisupload.php',
                from: '/template',
                to: '/home/work/odp/webroot/tour/backend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        dingrui: [
            {
                receiver: 'http://localhost:7889/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/Users/dingrui/workspace/money/tour_gitlab/backend/web/static/',
                /*to: '/home/work/odp/webroot/tour/frontend/assets/',*/
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://localhost:7889/fisupload.php',
                from: '/config',
                to: '/Users/dingrui/workspace/money/tour_gitlab/backend/runtime/Smarty/config',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://localhost:7889/fisupload.php',
                from: '/template',
                to: '/Users/dingrui/workspace/money/tour_gitlab/backend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        tip: [
            {
                receiver: 'http://10.208.119.27:8887/fisupload',
                from: '/static',
                subOnly: true,
                to: '/home/work/odp/webroot/static',
                /*to: '/home/work/odp/webroot/tour/frontend/assets/',*/
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://10.208.119.27:8887/fisupload',
                from: '/config',
                to: '/home/work/odp/data/smarty/config/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://10.208.119.27:8887/fisupload',
                from: '/template',
                to: '/home/work/odp/webroot/tour/frontend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        test2: [
            {
                receiver: 'http://10.48.30.182:8887/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/home/work/odp/webroot/static',
                /*to: '/home/work/odp/webroot/tour/frontend/assets/',*/
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://10.48.30.182:8887/fisupload.php',
                from: '/config',
                to: '/home/work/odp/data/smarty/config/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://10.48.30.182:8887/fisupload.php',
                from: '/template',
                to: '/home/work/odp/webroot/tour/frontend/views/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ],
        remote: [
            {
                receiver: 'http://qinfenxiang.cn/fisupload.php',
                from: '/static',
                subOnly: true,
                to: '/home/work/odp/webroot/static/',
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://qinfenxiang.cn/fisupload.php',
                from: '/config',
                to: '/home/work/odp/data/smarty/config/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }, {
                receiver: 'http://qinfenxiang.cn/fisupload.php',
                from: '/template',
                to: '/home/work/odp/template/',
                subOnly: true,
                exclude: /.*\.(?:svn|cvs|tar|rar|psd).*/
            }
        ]
    }
});
