//
//  HomeViewController.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/22/20.
//

import SnapKit

final class HomeViewController: UIViewController {
    private let stretchyHeaderHeight: CGFloat = 350
    private var viewModel = HomeViewModel()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureIndicatorView()
        viewModel.fetchPosts()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.didStartRequest = {
            self.activityIndicator.startAnimating()
        }
        viewModel.didEndRequest = {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
        viewModel.didGetError = { error in
            print(error)
        }
    }

    private func configureTableView() {
        view.addSubview(tableView)
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: stretchyHeaderHeight))
        header.imageView.image = UIImage(named: "image")
        tableView.tableHeaderView = header
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureIndicatorView() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            if let height = self.rowHeights[indexPath.row]{
//                return height
//            }else{
//                return defaultHeight
//            }
        if (indexPath.row != 0){
            return CGFloat(viewModel.posts[indexPath.row].height) / (CGFloat(viewModel.posts[indexPath.row].width) / view.frame.width)
        }
        return 200
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: PostTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
//        cell.usernameLabel.text = viewModel.posts[indexPath.row].id
//        cell.titleLabel.text = viewModel.posts[indexPath.row].created_at
        if (indexPath.row == 0)
        {
           return UITableViewCell();
        }
        cell.url = viewModel.posts[indexPath.row].urls["small"]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        viewModel.updatePostLikeCount(id: post.id)
    }
}
