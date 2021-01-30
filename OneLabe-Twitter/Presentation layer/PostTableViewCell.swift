//
//  PostTableViewCell.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/22/20.
//

import SnapKit

final class PostTableViewCell: UITableViewCell {

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    var url: String? {
        didSet {
            let data = try? Data(contentsOf: URL(string: url!)!)
            avatarImageView.image = UIImage(data: data!)
        
        }
    }
//    let usernameLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 15, weight: .medium)
//        return label
//    }()
//
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        return label
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUI() {
        configureAvatarImageView()
//        configureUsernameLabel()
//        configureTitleLabel()
    }

    private func configureAvatarImageView() {
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
//            $0.size.equalTo(40)
        }
    }
    
    

//    private func configureUsernameLabel() {
//        contentView.addSubview(usernameLabel)
//        usernameLabel.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(10)
//            $0.left.equalTo(avatarImageView.snp.right).offset(8)
//            $0.right.equalToSuperview().offset(-20)
//        }
//    }
//
//    private func configureTitleLabel() {
//        contentView.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints {
//            $0.left.right.equalTo(usernameLabel)
//            $0.top.equalTo(usernameLabel.snp.bottom).offset(4)
//            $0.bottom.equalToSuperview().offset(-10)
//        }
//    }
}
